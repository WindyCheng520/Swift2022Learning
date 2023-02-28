import UIKit
import Alamofire



let  url = "https://httpbin.org/get"
//Data示例
AF.request(url).responseData { response in
   switch response.result {
  case let .success(data):
      print("data:\(String(describing: data))")
  case let .failure(error):
      print(error)
 }
}

//String示例
AF.request(url).responseString { response in
   switch response.result {
  case let .success(data):
      print("data:\(String(describing: data))")
  case let .failure(error):
      print(error)
 }
}

////JSON示例
//AF.request(url).responseDecodable(of: User.self)  { response in
//   switch response.result {
//  case let .success(data):
//      print("data:\(String(describing: data))")
//  case let .failure(error):
//      print(error)
// }
//}

//自定义格式示例
struct PersonResponse: Decodable {
    let name: String
    let nickName: String
    let age : Int
}

AF.request(url).responseDecodable(of: PersonResponse.self) { response in
   switch response.result {
  case let .success(data):
      print("data:\(String(describing: data))")
  case let .failure(error):
      print(error)
 }
}
