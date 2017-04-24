# API attualmente implementate
Tutte le API rispondono con un oggetto JSON che contiene il risultato della chiamata. Tutte le chiamate hanno come primo parametro
dell'oggetto JSON di risposta il valore 'result' che pò contenere una condizione booleana true o false se la chiamata ha avuto successo. La maggior parte delle chiamate sono private e richiedono un token! Fino a quando il progetto sarà in fase di sviluppo il server accetterà chiamate da ogni dispositivo, in fase di produzione però sarà necessaio passare un particolare header per ogni chiamata, proprio del tipo di client (Android, iOs o Web), per ora potete non preoccuparvene.
* creare nuovo utente:
```
    POST /user/register HTTP/1.1
    Host: nicholasgiordano.it:3005
    Content-Type: application/x-www-form-urlencoded
    user=andrea&mail=pidno%40live.com&password=lasuapswd
```
* ottenere token (serve per effettuare tutte le altre operazioni)
```
    GET /user/token HTTP/1.1
    Host: nicholasgiordano.it:3005
    user: andrea
    pswd: lasuapswd
```
* accedere agli endpoint privati:
per accedere alle api private bisogna sempre passare nell'header della chiamata il token (precedentemente ottenuto).Attenzione, un token può scadere od essere invalidato! In caso di token non valido dobbiamo generarne uno nuovo con il metodo GET /user/token
```
    GET /user/test HTTP/1.1
    Host: nicholasgiordano.it:3005
    token: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhbmRyZWEiLCJleHAiOjE0OTMyODgwOTY0NzN9.sgVq4edOdfm9Ua_LhrcRSK0oj3-esbXXpIMW_NZ8rmY
```
* inserire/aggiornare preferenze parcheggio-veicolo utente

Con questa chiamata è possibile impostare le preferenze di parcheggio: tipologia di auto, disponibilità al parcheggio a pagamento (valore 'pagamento' da passare come true/false nel body) e disponibilità a parcheggi riservati (strisce gialle, valore 'speciale' da passare come true/false nel body ). Per questa chiamata è possibile omettere il valore pagamento e il valore speciale, che se non trasmessi vengono settati a false (utente non disposto al pagamento o al parcheggio su strisce gialle). E' sempre necessario passare nel body il campo 'tipo' che corrisponde alla tipologia di vettura. Il campo tipo può essere esclusivamente di queste tipologie: smart, utilitaria, berlina, monovolume, fuoristrada'
```
POST /user/preferenze HTTP/1.1
Host: nicholasgiordano.it:3005
token: **inserire qui token**
Cache-Control: no-cache
Content-Type: application/x-www-form-urlencoded

tipo=smart&pagamento=true&speciale=true

```
