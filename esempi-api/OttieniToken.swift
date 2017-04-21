//ottenimento token per utente con user prova e password testpswd
import Foundation

let headers = [
  "content-type": "prova",
  "pswd": "testpswd",
  "cache-control": "no-cache"
]

let postData = NSMutableData(data: "user=prova".data(using: String.Encoding.utf8)!)
postData.append("&password=testpswd".data(using: String.Encoding.utf8)!)
postData.append("&mail=test@test.it".data(using: String.Encoding.utf8)!)

let request = NSMutableURLRequest(url: NSURL(string: "http://nicholasgiordano.it:3005/user/token")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "GET"
request.allHTTPHeaderFields = headers
request.httpBody = postData as Data

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
  if (error != nil) {
    print(error)
  } else {
    let httpResponse = response as? HTTPURLResponse
    print(httpResponse)
  }
})
