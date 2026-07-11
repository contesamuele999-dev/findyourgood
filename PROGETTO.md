# Find Your Good — Documento di progetto

App per tracciare comportamenti e dati fisici quotidiani e scoprire, tramite correlazioni, cosa fa bene e cosa fa male al proprio corpo.

## Prompt migliorato (versione definitiva della tua idea)

> Crea una web app (PWA, un unico file HTML, dati salvati sul dispositivo, nessun account) chiamata "Find Your Good", in italiano, per me e i miei familiari (profili multipli sullo stesso dispositivo). Serve a registrare ogni giorno, in 1-2 minuti, dati su corpo e abitudini, e a scoprire correlazioni tra comportamenti e malesseri.
>
> **Check-in giornaliero rapido** (pulsanti grandi, faccine, zero tastiera dove possibile): peso, umore 1-5, stress 1-5, affollamento mentale 1-5, qualità del sonno 1-5 con orari di addormentamento e sveglia, pasti (colazione/pranzo/cena/merende: orario, quantità poco/normale/troppo, eccezione alla dieta sì/no con nota), sintomi a scelta multipla (mal di testa, mal di pancia, dolori, fastidi, allergie intense, malattia, ferita — con nota se cicatrizza lentamente, preso freddo), attività rigenerative (meditazione, respirazione, attività fisica, pisolino con orario rispetto ai pasti, sauna/trattamenti, vacanza), igiene (lavaggi denti 0/1/2+, giornata in pessime condizioni igieniche sì/no), sedentarietà 1-5, note libere.
>
> **Promemoria e recupero**: all'apertura l'app mostra i giorni non compilati e permette di inserirli a ritroso; promemoria giornaliero.
>
> **Analisi**: grafici semplici dell'andamento (peso, umore, stress, sonno) e correlazioni in linguaggio semplice ("Nei giorni dopo un'eccezione alla dieta hai avuto mal di pancia il 40% in più"), considerando anche l'effetto del giorno dopo (lag di 1 giorno).
>
> **Utenti target**: persone poco pratiche di tecnologia → grafica pulitissima, testi grandi, un'azione per schermata, niente gergo tecnico. Export/import dei dati in un file per backup e passaggio ad altri dispositivi.

## Cosa ho aggiunto rispetto all'idea originale

- **Lag di 1 giorno nelle correlazioni**: molti effetti (cibo → mal di pancia, freddo → malattia) si vedono il giorno dopo.
- **Export/import backup**: i dati stanno solo sul dispositivo; senza backup un telefono rotto = dati persi.
- **Compilazione a due livelli**: 6 domande essenziali in 1 minuto, dettagli opzionali espandibili — altrimenti dopo una settimana si smette di compilare.
- **Streak e barra di completezza**: piccola motivazione a non saltare giorni (le correlazioni richiedono continuità).
- **Soglia minima dati**: le correlazioni compaiono solo con almeno ~14 giorni di dati, per evitare conclusioni fuorvianti.
- **Avvertenza**: l'app suggerisce correlazioni, non diagnosi. Per sintomi persistenti, consultare un medico.

## Architettura

- Un solo file: `find-your-good.html`. Funziona offline, aperto direttamente o da schermata home.
- Dati in `localStorage` del browser, per profilo, per data (formato `AAAA-MM-GG`).
- Nessun server, nessun dato inviato all'esterno.
- Limite noto: le notifiche push a app chiusa non sono possibili con un file locale; il recupero giorni mancanti compensa. In futuro, hosting su un sito + service worker abiliterebbe notifiche vere.

## Schermate

1. **Oggi** — check-in del giorno, sezioni espandibili, salvataggio automatico.
2. **Diario** — calendario mensile: verde = compilato, rosso = mancante; tocca un giorno per compilarlo/modificarlo.
3. **Analisi** — grafici andamento + elenco correlazioni trovate in linguaggio semplice.
4. **Impostazioni** — profili (aggiungi/rinomina), export/import backup, cancellazione dati.

## Versione 2 — novità

- **Scheda Salute (💊)**: farmaci/integratori con dose e periodo (l'analisi confronta giorni con/senza per trovare miglioramenti ed effetti collaterali), visite ed esami anche invasivi (correlati ai disturbi dei giorni successivi), notizie importanti belle/brutte (per misurare effetto placebo/nocebo), ipotesi personali con indizi a favore/contro e stato aperta/confermata/smentita.
- **Nuovi dati giornalieri**: temperatura del giorno, stanchezza, sonnolenza, sole preso (obiettivo 15 min, 30 se nuvoloso), tag "Un bel po'" nelle quantità dei pasti.
- **Calendario arricchito**: pallini colorati per disturbi, visite, notizie e farmaci attivi; elenco eventi del mese; ogni giorno resta modificabile con un tocco.
- **Analisi ampliata**: statistiche (disturbo più frequente, stagione più critica, medie), previsione del rischio di ammalarsi (stagionalità + freddo/sonno/stress/stanchezza recenti), consigli personalizzati basati su linee guida OMS e ricerca consolidata applicati ai propri dati.
- **Cloud e login (Supabase)**: registrazione/accesso email+password, sincronizzazione automatica tra dispositivi con unione intelligente dei dati (vince la modifica più recente). Guida passo passo in `SUPABASE.md`.

## Possibili evoluzioni

Hosting online con notifiche push reali, grafici avanzati, promemoria via calendario/email, meteo automatico da API.
