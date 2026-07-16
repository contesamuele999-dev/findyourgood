# Mettere Find Your Good online (GitHub Pages)

Guida passo passo per pubblicare l'app su internet, gratis, con un indirizzo tipo
`https://TUONOME.github.io/find-your-good/`. Da fare una volta sola; dopo bastano due clic per aggiornare.

## Cosa serve (una volta)

1. **Un account GitHub** (gratuito): registrati su https://github.com
2. **Git installato sul PC**: scaricalo da https://git-scm.com/download/win e installa lasciando le opzioni di default.

## Passo 1 — Crea il repository

1. Su GitHub premi in alto a destra **+ → New repository**.
2. **Repository name**: `find-your-good` (o come preferisci).
3. Lascialo **Public** (necessario per GitHub Pages gratis).
4. NON aggiungere README, .gitignore o licenza (lascia tutto vuoto).
5. Premi **Create repository**.
6. Nella pagina che appare, copia l'URL che finisce con `.git`
   (es. `https://github.com/TUONOME/find-your-good.git`). Ti serve al passo 2.

## Passo 2 — Pubblica dal PC

1. Nella cartella dell'app fai doppio clic su **`pubblica.bat`**.
2. Al primo avvio ti chiede l'URL del repo: incolla quello copiato al passo 1 e premi INVIO.
   - Se Git ti chiede di accedere a GitHub, fallo (si apre una finestra del browser).
3. Ti chiede una breve descrizione della modifica: scrivi qualcosa (o premi solo INVIO).
4. Attendi il messaggio "Fatto!". I file sono su GitHub.

## Passo 3 — Attiva GitHub Pages (una volta sola)

1. Sul repo GitHub apri **Settings → Pages** (menu a sinistra).
2. In **Source** scegli **Deploy from a branch**.
3. In **Branch** scegli **main** e cartella **/ (root)**, poi **Save**.
4. Dopo 1-2 minuti in cima alla pagina compare l'indirizzo pubblico:
   `https://TUONOME.github.io/find-your-good/`
5. Apri quel link: vedrai l'app. Salvalo tra i preferiti / aggiungilo alla schermata home del telefono.

## Aggiornare l'app in futuro

Ogni volta che modifichi `index.html` (l'unico file dell'app):

1. Doppio clic su **`pubblica.bat`**
2. Scrivi cosa hai cambiato (o INVIO)
3. Dopo 1-2 minuti l'indirizzo online e' aggiornato.

`index.html` e' la pagina mostrata da GitHub Pages: e' anche il file che modifichi. (Non esiste piu' un file separato `find-your-good.html`.)

## Provare in locale (senza pubblicare)

Doppio clic su **`avvia-test.bat`**: apre l'app nel browser da `http://localhost:8000`.
Comodo per provare le modifiche prima di pubblicarle. Per chiudere il server, chiudi la finestra nera.

## Note

- I dati dell'app restano sul dispositivo (o su Supabase se lo colleghi): pubblicare online non li espone a nessuno, viene condiviso solo il "programma", non i tuoi diari.
- Se `pubblica.bat` da' errore "git non e' installato", installa Git (link sopra) e riprova.
- Se cambi PC, basta scaricare la cartella e rilanciare `pubblica.bat` (ti richiedera' l'URL del repo la prima volta).
