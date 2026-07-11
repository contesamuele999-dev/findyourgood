# Guida: collegare Find Your Good al cloud (Supabase)

Con questa configurazione i dati vengono salvati nel cloud e puoi usarli da più dispositivi (telefono + PC) con email e password. È gratuito. Servono circa 10 minuti, una volta sola.

## Passo 1 — Crea il progetto

1. Vai su **https://supabase.com** e premi **Start your project**.
2. Registrati (va bene l'account Google o GitHub, o email).
3. Premi **New project**: scegli un nome (es. `find-your-good`), una password per il database (salvala da qualche parte, non servirà nell'app) e la regione **Europe (Frankfurt)** o simile. Attendi 1-2 minuti che il progetto sia pronto.

## Passo 2 — Crea la tabella dei dati

1. Nel menu a sinistra apri **SQL Editor**.
2. Incolla questo codice e premi **Run**:

```sql
create table diario (
  user_id uuid primary key references auth.users(id) on delete cascade,
  contenuto jsonb not null,
  aggiornato timestamptz default now()
);
alter table diario enable row level security;
create policy "solo i propri dati" on diario
  for all using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
```

Deve comparire "Success". La regola di sicurezza (RLS) garantisce che ogni persona veda **solo i propri dati**.

## Passo 3 — Copia le chiavi nell'app

1. Nel menu a sinistra: **Project Settings → API** (oppure "API Keys").
2. Copia il **Project URL** (tipo `https://abcdefgh.supabase.co`).
3. Copia la chiave **anon public** (una riga lunghissima di lettere).
4. Apri l'app → scheda **Altro** → **☁️ Cloud e accesso** → incolla URL e chiave → **Salva configurazione**.

## Passo 4 — Registrati e accedi

1. Sempre in **Cloud e accesso**, scrivi la tua email e una password (minimo 6 caratteri) e premi **Registrati**.
2. Controlla l'email e clicca il link di conferma.
3. Torna nell'app e premi **Accedi**.

Da questo momento ogni modifica si salva da sola nel cloud (vedi lo stato "☁️ Sincronizzato"). Sugli altri dispositivi basta aprire l'app, inserire la stessa configurazione (passo 3) e fare login: i dati arrivano da soli.

## Note

- Ogni familiare che vuole i propri dati nel cloud sul proprio dispositivo può usare la **stessa configurazione** ma registrarsi con la **propria email**.
- L'app continua a funzionare anche offline: si risincronizza appena torni connesso e fai una modifica (o premi "Sincronizza ora").
- Se dopo la registrazione non arriva l'email, controlla lo spam. In Supabase: **Authentication → Providers → Email** deve essere attivo (lo è di default).
