//ottenimento token per utente con user prova e password testpswd
import Foundation

let headers = [
  "user": "prova",
  "pswd": "testpswd",
  "cache-control": "no-cache"
]

let request = NSMutableURLRequest(url: NSURL(string: "http://nicholasgiordano.it:3005/user/token")! as URL,
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
