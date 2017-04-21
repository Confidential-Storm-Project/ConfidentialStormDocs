//esempio che crea un nuovo utente con nik cio, password caca e mail d@f.t
import Foundation

let headers = [
  "content-type": "application/x-www-form-urlencoded",
  "cache-control": "no-cache"
]

let postData = NSMutableData(data: "user=cio".data(using: String.Encoding.utf8)!)
postData.append("&password=cacca".data(using: String.Encoding.utf8)!)
postData.append("&mail=d@f.t".data(using: String.Encoding.utf8)!)

let request = NSMutableURLRequest(url: NSURL(string: "http://nicholasgiordano.it:3005/user/register")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "POST"
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

dataTask.resume()
