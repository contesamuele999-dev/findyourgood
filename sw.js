/* Service worker di Find Your Good: rende l'app installabile e utilizzabile offline. */
const CACHE = "fyg-cache-v4";
const ASSETS = [
  "./",
  "index.html",
  "find-your-good.html",
  "manifest.json",
  "icon.svg",
  "https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.min.js"
];

self.addEventListener("install", (e) => {
  e.waitUntil(
    caches.open(CACHE).then((c) => Promise.all(ASSETS.map((u) => c.add(u).catch(() => {}))))
  );
  self.skipWaiting();
});

self.addEventListener("activate", (e) => {
  e.waitUntil(
    caches.keys().then((keys) => Promise.all(keys.filter((k) => k !== CACHE).map((k) => caches.delete(k))))
  );
  self.clients.claim();
});

function inCache(req, res) {
  const copy = res.clone();
  caches.open(CACHE).then((c) => c.put(req, copy).catch(() => {}));
  return res;
}

self.addEventListener("fetch", (e) => {
  const req = e.request;
  if (req.method !== "GET") return;
  // Le chiamate API a Supabase passano sempre dalla rete (dati sempre aggiornati).
  if (req.url.includes("supabase.co")) return;

  // Pagine HTML (l'app vera e propria): "network-first".
  // Se sei online prende SEMPRE la versione più recente; la cache serve solo offline.
  const accept = req.headers.get("accept") || "";
  const isHTML = req.mode === "navigate" || accept.includes("text/html") || /\.html(\?|$)/.test(req.url);
  if (isHTML) {
    e.respondWith(
      fetch(req)
        .then((res) => inCache(req, res))
        .catch(() => caches.match(req).then((hit) => hit || caches.match("index.html")))
    );
    return;
  }

  // Altri file (icone, libreria Supabase): "cache-first" per velocità.
  e.respondWith(
    caches.match(req).then((hit) =>
      hit || fetch(req).then((res) => inCache(req, res)).catch(() => caches.match("index.html"))
    )
  );
});
