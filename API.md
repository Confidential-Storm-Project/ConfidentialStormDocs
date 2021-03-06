# API attualmente implementate
Tutte le API rispondono con un oggetto JSON che contiene il risultato della chiamata. Tutte le chiamate hanno come primo parametro
dell'oggetto JSON di risposta il valore 'result' che pò contenere una condizione booleana true o false se la chiamata ha avuto successo. La maggior parte delle chiamate sono private e richiedono un token! Fino a quando il progetto sarà in fase di sviluppo il server accetterà chiamate da ogni dispositivo, in fase di produzione però sarà necessaio passare un particolare header per ogni chiamata, proprio del tipo di client (Android, iOs o Web), per ora potete non preoccuparvene. **Tutte la api sono fornite su HTTPS**
## Api relative all'utente
* creare nuovo utente:
```
    POST /api/user/register HTTP/1.1
    Host: lalapark.it
    Content-Type: application/x-www-form-urlencoded
    user=andrea&mail=pidno%40live.com&password=lasuapswd
```
* ottenere token (serve per effettuare tutte le altre operazioni)
```
    GET /api/user/token HTTP/1.1
    Host: lalapark.it
    user: andrea
    pswd: lasuapswd
```
* accedere agli endpoint privati:
per accedere alle api private bisogna sempre passare nell'header della chiamata il token (precedentemente ottenuto).Attenzione, un token può scadere od essere invalidato! In caso di token non valido dobbiamo generarne uno nuovo con il metodo GET /user/token

* inserire/aggiornare preferenze parcheggio-veicolo utente

Con questa chiamata è possibile impostare o aggiornare le preferenze di parcheggio di un utente: tipologia di auto, disponibilità al parcheggio a pagamento (valore 'pagamento' da passare come true/false nel body) e disponibilità a parcheggi riservati (strisce gialle, valore 'speciale' da passare come true/false nel body ). Per questa chiamata è possibile omettere il valore pagamento e il valore speciale, che se non trasmessi vengono settati a false (utente non disposto al pagamento o al parcheggio su strisce gialle). E' sempre necessario passare nel body il campo 'tipo' che corrisponde alla tipologia di vettura. Il campo tipo può essere esclusivamente di queste tipologie: smart, utilitaria, berlina, monovolume, fuoristrada'
```
POST /api/user/preferenze HTTP/1.1
Host: lalapark.it
token: **inserire qui token**
Cache-Control: no-cache
Content-Type: application/x-www-form-urlencoded

tipo=smart&pagamento=true&speciale=true

```
* inserire/aggiornare il profilo personale di un utente

Con questa chiamata è possibile settare nome, cognome e sesso. Nessun campo è obbligatorio, vengono inseriti o aggiornati esclusivamente i dati passati all'interno del corpo del body.
```
POST /api/user/profilo HTTP/1.1
Host: lalapark.it
token: **iltokenqui**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache

nome=andrea&cognome=lacava&sesso=m
```
* aggiornare indirizzo mail di un utente

Con questa chiamata è possibile modificare la mail comunicata dall'utente in fase di registrazione
```
POST /api/user/email HTTP/1.1
Host: lalapark.it
token: **iltokenqui**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache

email=nicholas.giordano%40live.com
```
* ottenere informazioni su un utente

Info su username/mail/ultimo login
```
GET /api/user/login HTTP/1.1
Host: lalapark.it
token: **iltokenqui**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
```
Info sul profilo e mail
```
GET /api/user/profilo HTTP/1.1
Host: lalapark.it
token: **iltokenqui**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
```
Info sulle preferenze
```
GET /api/user/preferenze HTTP/1.1
Host: lalapark.it
token: **iltokenqui**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
```
* Cancellare un utente
```
DELETE /api/user/kill HTTP/1.1
Host: lalapark.it
token: **iltokenqui**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
```
* Modificare la password di un utente
```
POST /api/user/newpassword HTTP/1.1
Host: lalapark.it
token: **qui il token**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache

vecchia=vecchiapsw&nuova=nuovapsw
```
* Registrazione utente con tutti i campi

Questa chiamata registra un nuovo utente con tutte le sue preferenze e le sue info di profilo
```
POST /api/user/bigregister HTTP/1.1
Host: lalapark.it
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache

user=test1&mail=test%40test.it&password=test&tipo=utilitaria&speciale=false&nome=nicholas&cognome=giordano&sesso=m&privacy=false&pagamento=true
```
## Gestire foto profilo dell'utente
Per gestire la foto profilo dell'utente esisteno due chiamate, una per settarla e una per prenderne i riferimenti. Se un utente setta una nuova foto profilo quella precedentemente impostata non sarà più disponibile. **Attenzione:** nel momento in cui si richiedono i riferimenti di una foto profilo il server restituisce l'endpoi da dove è possibile scaricare il file condificato (e senza estensione) e l'estensione della foto. Spetta al client scaricare il file e aggiungere l'estensione semplicemente rinominando il file aggiungedo alla fine del nome l'estensione. I file vengono codificati dal server e salvati senza estensione per motivi di sicurezza.
- Inserimento nuova foto profilo

Nella campo 'foto' del body deve essere passato il file come multipart/form-data

Nota che il name del campo 'foto' corrisponde al nome del parametro passato, pertanto **non** va modificato.

```
POST /api/user/pic HTTP/1.1
Host: lalapark.it
token: **qui il token**
Cache-Control: no-cache
Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW

------WebKitFormBoundary7MA4YWxkTrZu0gW
Content-Disposition: form-data; name="foto"; filename=""
Content-Type:

------WebKitFormBoundary7MA4YWxkTrZu0gW--
```
E' possibile vedere un esempio in swift del caricamento della foto cliccando [qui](https://github.com/Confidential-Storm-Project/ConfidentialStormDocs/blob/master/esempi-api/caricafoto.swift).

E' possibile vedere un esempio in java(android con ok http) del caricamento della foto cliccando [qui](https://github.com/Confidential-Storm-Project/ConfidentialStormDocs/blob/master/esempi-api/caricafoto.java).
- Ottenimento foto profilo corrente 
```
GET /api/user/pic HTTP/1.1
Host: lalapark.it
token: **qui il token**
Cache-Control: no-cache
```
- Esempio di risposta alla GET:
```
Viene restituita l'immagine
```
Se l'immagine non è presente o non è mai stata caricata viene restituito un avatar di default

## Api relative al parcheggio
- Inserimento nuovo parcheggio ex novo
    - lat (specifica la latitudine del parcheggio) Double
    - lon (specifica la longitudine del parcheggio) Double
    - wait (eventuale tempo che l'utente è disposto ad attendere in minuti) Int
    - speciale (eventuale parcheggio disabili) Boolean
    - pagamento (eventuale parcheggio a pagamento) Boolean
    - tipo (tipo di veicolo per il parcheggio) String

In questa chiamata tutti i corpi del body sono obbligatori ad eccezzione dell'eventuale tempo di attesa che se non fornito viene impostato a zero. Con ex novo si intende un parcheggio liberato e non precedentemente ottenuto utilizando l'applicazione.
```
POST /api/park/nuovo HTTP/1.1
Host: lalapark.it
token: **qui il token**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache

lat=9&lon=0&wait=0&speciale=true&pagamento=false&tipo=smart
```
- Ricerca di un parcheggio in base alla tipologia
    - TIPOLOGIA (Specifica la tipologia di parcheggio che si cerca:'gratuiti', 'pagamento' e 'speciali' sono le opzioni possibili
    - veicolo (scpeifica il veicolo per il quale si sta facendo la richiesta)
    - lat (latitudine in cui si trova l'utente)
    - lon (longitudine in cui si trova l'utente)
    - raggio (distanza in metri all'interno della quale si cercano parcheggi

**Tutti i dati vanno passati nell'header per queste chiamate**
**Non vengono mostrati i parcheggi segnalati da più di 60 minuti!**
La voce **quando** restituisce il tempo in millisecondi trascorso da quando il parcheggio è stato liberato
```
GET /api/park/TIPOLOGIA HTTP/1.1
Host: lalapark.it
token: *qui il token*
veicolo: smart
lat: 41.921289
lon: 12.510428
raggio: 1000
```
Esempio di chiamata alla ricerca di parcheggi 'speciali':
```
GET /api/park/speciali HTTP/1.1
Host: lalapark.it
token: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJwcm92YSIsImV4cCI6MTQ5NTQ1MjU1MzUwOX0.u0Rb2Ss6c8IQSlIfG5CSfimKbQz8Je9-KUDJlTzAIiw
veicolo: smart
lat: 41.921289
lon: 12.510428
raggio: 1000
```
Esempio di risposta affermativa:
```
{
  "result": "true",
  "parcheggi": [
    {
      "id": "5919912371cb0617e095bbb6",
      "distanza": 22.109124427338447,
      "lat": "41.921365",
      "lon": "12.510181",
      "veicolo": "smart",
      "pagamento": "false",
      "speciale": "true",
      "attesa": 0,
      "quando": "3500000",
      "da": "prova"
    }
  ]
}
```
La risposta contiene la distanza in linea d'aria tra l'utente e il parcheggio, la posizione geografica del parcheggio, info varie, il momento in cui il parcheggio è stato liberato e il nome dell'utente che lo ha liberato.

Esempio di risposta senza disponibilità di parcheggi:
```
{
  "result": "fail",
  "status": "nessun parcheggio a pagemento o gratuito trovato"
}
```
## Application core api prenotazione parcheggio/annullamento e conferma

Le seguenti api trattano la possibilità di un utente di prenotare un parcheggio (e quindi navigare verso il parcheggio), di annullare l'ultima prenotazione fatta e di segnalare il parcheggio come effettiato (l'utente che ha prenotato un parcheggio ci arriva e riesce a parcheggaircisi)
- prenotazione parcheggio: (bisogna trasmettere l'id alfanumerico del parcheggio che si vuole prenotare)
```
POST /api/park/prenota HTTP/1.1
Host: lalapark.it
token: **qui il token**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache

id=idparcheggio
```
- Annullamento della prenotazione
```
DELETE /api/park/annulla HTTP/1.1
Host: lalapark.it
token: **qui il token**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
```
Per la chiamata di annullamento non è necessario passare nulla se non il token: in automatico viene annullata l'ultima prenotazione fatta dall'utente (per il semplice fatto che un utente può prenotare e quindi recarsi solo verso un posto alla volta)
- Conferma di parcheggio:
Questa chiamata rappresenta l'evento in cui l'utente arriva al parcheggio prenotato (verso cui si stava dirigendo) e riesce a trovarlo
```
POST /api/park/completa HTTP/1.1
Host: lalapark.it
token: **qui il token**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
```
Per la chiamata di conferma basta passare il token.
- Segnalazione parcheggio occupato all'arrivo
```
DELETE /api/park/fallito HTTP/1.1
Host: lalapark.it
token: **qui il token**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
```
Se questa chiamata ha successo, la prossima ricerca per l'utente che ha trovato il parcheggio già occupato sarà gratuita
## Gestione dei punteggi
E' ufficialmente in vigore il sistema dei punteggi che funziona nel seguente modo: agli utenti appena registrati viene dato un punteggio bonus di 50 stelle. Per gli utenti già registrati registrati prima di questa implementazione (13/07/2017) è obbligatorio effettuare log-out e log-in per continuare ad utilizzare correttamente il servizio senza errori.
**Regolamento del punteggio:** Ogni utente che effettua una ricerca per un qualsiasi tipo di parcheggio spende 1 stella. Nel momento in cui un parcheggio viene prenotato, l'utente che lo ha liberato riceve una stella, nel momento in cui un parcheggio viene confermato (l'utente che lo ha prenotato riesce a parcheggiarsi senza trovare intralci) l'utente che lo ha liberato riceve un'ulteriore stella. Se l'utente arriva in un parcheggio e lo trova occupato già (segnalandolo tramite l'apposita api), quell'utente avrà la prossima ricerca gratuita. Agli utenti che hanno 0 stelle è impossibile effettuare le ricerche.
**Regolamento anti-furbi:** Un utente che prenota un parcheggio da se stesso liberato non riceve alcun punteggio! Un unico utente non può in nessun modo prendere punti effettuando operazioni su parcheggi da lui liberati.
- Ottenere punteggio stelle residue:
```
GET /api/user/star HTTP/1.1
Host: lalapark.it
token: **qui il token**
Cache-Control: no-cache
```
- Esempio di risposta alla GET:
```
{
  "result": true,
  "star": 50
}
```
## Altre API
- Segnalare un bug
Basta popolare il campo msg del body con il messaggio che l'utente vuole segnalare, la piattaforma da cui proviene la segnalazione viene riconosciuta in automatico. Non è possibile inviare bug fin quando uno di quelli segnalati non viene risolto.
```
POST /api/libs/bug HTTP/1.1
Host: lalapark.it
token: **qui il token**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
msg=testo_che_user_invia
```
- Recupero password
L'utente riceverà una mail contenente un link valido 24 ore mediante il quale potrà ripristinare la propria password
```
POST /api/user/lostpassword HTTP/1.1
Host: lalapark.it
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
username=_nome_utente_che_vuole_recuperare
```