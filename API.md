# API attualmente implementate
Tutte le API rispondono con un oggetto JSON che contiene il risultato della chiamata. Tutte le chiamate hanno come primo parametro
dell'oggetto JSON di risposta il valore 'result' che pò contenere una condizione booleana true o false se la chiamata ha avuto successo. La maggior parte delle chiamate sono private e richiedono un token! Fino a quando il progetto sarà in fase di sviluppo il server accetterà chiamate da ogni dispositivo, in fase di produzione però sarà necessaio passare un particolare header per ogni chiamata, proprio del tipo di client (Android, iOs o Web), per ora potete non preoccuparvene.
## Tutte le api devono essere chiamate su HTTPS!
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

Con questa chiamata è possibile settare nome, cognome, sesso e privacy. Il campo privacy sarà utilizzato per mostrare o meno le informazioni personali (nome/cognome/sesso) agli altri utenti. Almeno un campo tra nome o cognome è obbligatorio, se non specificato la privacy viene settata a false. Se la privacy è settata a false le informazioni dell'utente non verranno mai mostrate a nessuno. Per essere un campo valido il sesso deve essere 'm' oppure 'f'
```
POST /api/user/profilo HTTP/1.1
Host: lalapark.it
token: **iltokenqui**
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache

nome=andrea&cognome=lacava&sesso=m&privacy=true
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
Info sul profilo
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
