//esempio di accesso ad un api privata utilizzando un token validamente ottenuto
//la chiamata GET /user/test restituisce il nome dell'utente per cui il token è valido
//ha solo scopo di test per gli sviluppatori, la chiamata sarà rimossa in fase di produzione
import Foundation

let headers = [
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJwcm92YSIsImV4cCI6MTQ5MzQxMDQxMTk0Mn0.8OIDCt9XTB2z-jh-Wn66pKGxa8C4zUVbiND9pqI6Yew",
  "cache-control": "no-cache"
]

let request = NSMutableURLRequest(url: NSURL(string: "http://nicholasgiordano.it:3005/user/test")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "GET"
request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
  if (error != nil) {
    print(error)
  } else {
    let httpResponse = response as? HTTPURLResponse
    print(httpResponse)
  }
})

dataTask.resume()
