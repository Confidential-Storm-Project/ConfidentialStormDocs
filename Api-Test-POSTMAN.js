{"id":"4a5c50cf-32db-24e8-1861-2aee0aa2094a","name":"storm project","description":"","order":["7e6893be-4c8a-c6b1-d0fa-68d24cbed168","230df8c4-3937-c6c2-6424-dd59c6017eab","0090a2fb-7c24-1338-045d-f8fef1a6382c"],"folders":[],"timestamp":1492679803203,"owner":"1928297","public":false,"requests":[{"id":"0090a2fb-7c24-1338-045d-f8fef1a6382c","headers":"token: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhbmRyZWEiLCJleHAiOjE0OTMyODgwOTY0NzN9.sgVq4edOdfm9Ua_LhrcRSK0oj3-esbXXpIMW_NZ8rmY\n","url":"localhost:3000\/user\/test","pathVariables":[],"preRequestScript":null,"method":"GET","collectionId":"4a5c50cf-32db-24e8-1861-2aee0aa2094a","data":null,"dataMode":"params","name":"Test validation token","description":"Deve essere restituito oggetto json con nome utente per cui quel token \u00e8 valido","descriptionFormat":"html","time":1492683442896,"version":2,"responses":[],"tests":null,"currentHelper":"normal","helperAttributes":[]},{"id":"230df8c4-3937-c6c2-6424-dd59c6017eab","headers":"user: nicholas\npswd: test\n","url":"localhost:3000\/user\/token","pathVariables":[],"preRequestScript":null,"method":"GET","collectionId":"4a5c50cf-32db-24e8-1861-2aee0aa2094a","data":null,"dataMode":"params","name":"Get Token","description":"","descriptionFormat":"html","time":1492680875255,"version":2,"responses":[],"tests":null,"currentHelper":"normal","helperAttributes":[]},{"id":"7e6893be-4c8a-c6b1-d0fa-68d24cbed168","headers":"Content-Type: application\/x-www-form-urlencoded\n","url":"localhost:3000\/user\/register","preRequestScript":null,"pathVariables":[],"method":"POST","data":[{"key":"user","value":"pond","type":"text","enabled":true},{"key":"mail","value":"pino@live.com","type":"text","enabled":true},{"key":"password","value":"cacca","type":"text","enabled":true}],"dataMode":"urlencoded","tests":null,"currentHelper":"normal","helperAttributes":[],"time":1492680376067,"name":"Registrazione nuovo utente","description":"","collectionId":"4a5c50cf-32db-24e8-1861-2aee0aa2094a","responses":[]}]}
