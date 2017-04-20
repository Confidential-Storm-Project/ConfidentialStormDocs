# API attualmente implementate
Tutte le API rispondono con un oggetto JSON che contiene il risultato della chiamata. Tutte le chiamate hanno come primo parametro
dell'oggetto JSON di risposta il valore 'result' che pò contenere una condizione booleana true o false se la chiamata ha avuto successo
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
* accedere agli endpoint privati
Per accedere alle api private bisogna sempre passare nell'header della chiamata il token (precedentemente ottenuto)
```
    GET /user/test HTTP/1.1
    Host: nicholasgiordano.it:3005
    token: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhbmRyZWEiLCJleHAiOjE0OTMyODgwOTY0NzN9.sgVq4edOdfm9Ua_LhrcRSK0oj3-esbXXpIMW_NZ8rmY
```

