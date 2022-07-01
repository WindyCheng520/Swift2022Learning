import UIKit
import Alamofire

//https://github.com/Alamofire/Alamofire/blob/master/Documentation/AdvancedUsage.md

let url = "https://httpbin.org/get"

AF.request("https://httpbin.org/get")

//等价于
//let session = Session.default
//session.request("https://httpbin.org/get")


//可以使用Modifier来自定义请求
AF.request(url, requestModifier: {$0.timeoutInterval = 5}).validate().response { reponse in
    
}

AF.request("https://httpbin.org/get") { urlRequest in
    urlRequest.timeoutInterval=5
    urlRequest.allowsConstrainedNetworkAccess=false}.response { reponse in
        
    }

//
//往请求里面添加参数
//参数必须是Encodable类型，并且满足ParameterEncoder协议。

struct Login: Encodable {
    let email: String
    let password: String
}

let login = Login(email: "test@test.test", password: "testPassword")

AF.request("https://httpbin.org/post",
           method: .post,
           parameters: login,
           encoder: JSONParameterEncoder.default).response { response in
  //  debugPrint(response)
}

//encoder有两种，一种是JSON格式的JSONParameterEncoder，另一种是URLEncodedFormParameterEncoder。

//
//通过URL编码格式发送请求
//通过URL发送请求的API参数不同，参数有：（请求路径、请求参数（可选）、请求编译器（.methodDependent/.queryString/.httpBody）），编译器根据请求的Http类型决定。
//例如POST请求：
let parameters: [String: [String]] = [
"foo": ["bar"],
"baz": ["a", "b"],
"qux": ["x", "y", "z"]
]

// All three of these calls are equivalent
AF.request("https://httpbin.org/post", method: .post, parameters: parameters)
AF.request("https://httpbin.org/post", method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default)
AF.request("https://httpbin.org/post", method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder(destination: .httpBody))


//URLEncodedFormEncoder
//从Swift4.x开始，对字典采用哈希算法会导致在传入Collection类型的时候内部排序混乱，可以使用URLEncodedFormEncoder来对需要编码的键值对进行排序。
//let encoder = URLEncodedFormParameterEncoder(encoder: URLEncodedFormEncoder(alphabetizeKeyValuePairs: false))
//1
//Format的传参根据需要进行编码的类型不同而不同，每一个参数对应的方法也不同，具体可以参考官方文档：
//https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md#manual-authentication

//6.通过JSON编码发送请求
//通过JSON发送请求似乎就没有URL那么麻烦了。编码器的种类有3种，都是可以根据名字知道意思的。例子如下

let parameters1: [String: [String]] = [
    "foo": ["bar"],
    "baz": ["a", "b"],
    "qux": ["x", "y", "z"]
]

AF.request("https://httpbin.org/post", method: .post, parameters: parameters1, encoder: JSONParameterEncoder.default)
AF.request("https://httpbin.org/post", method: .post, parameters: parameters1, encoder: JSONParameterEncoder.prettyPrinted)
AF.request("https://httpbin.org/post", method: .post, parameters: parameters1, encoder: JSONParameterEncoder.sortedKeys)

// HTTP body: {"baz":["a","b"],"foo":["bar"],"qux":["x","y","z"]}



//可以自定义JSON编码器行为，通过穿件JSONEncoder实例来实现：
let encoder = JSONEncoder()
encoder.dateEncodingStrategy = .iso8601
encoder.keyEncodingStrategy = .convertToSnakeCase
let parameterEncoder = JSONParameterEncoder(encoder: encoder)


//也可以在外部手动创建参数：

let url1 = URL(string: "https://httpbin.org/get")!
var urlRequest = URLRequest(url: url1)

let parameters2 = ["foo": "bar"]
let encodedURLRequest = try URLEncodedFormParameterEncoder.default.encode(parameters2,
                                                                          into: urlRequest)



//HttpHeader：
//创建HttpHeader的方式有两种：
//一种是类似于在POSTMAN的Header中手动填写键值对的方式：
let headers: HTTPHeaders = [
    "Authorization": "Basic VXNlcm5hbWU6UGFzc3dvcmQ=",
    "Accept": "application/json"
]

//AF.request("https://httpbin.org/headers", headers: headers).responseDecodable(of: DecodableType.self) { response in
//    debugPrint(response)
//}

//另一种是类似于POSTMAN中填写username和password的方式：

let headers1: HTTPHeaders = [
    .authorization(username: "Username", password: "Password"),
    .accept("application/json")
]

//AF.request("https://httpbin.org/headers", headers: headers1).responseDecodable(of: DecodableType.self) { response in
//    debugPrint(response)
//}



//Response验证
//自动化验证(自动化验证会要求返回的Http状态码在200-300之间)：
AF.request("https://httpbin.org/get").validate().responseData { response in
    debugPrint(response)
}



//手动验证，在传参中添加表达式：
AF.request("https://httpbin.org/get")
    .validate(statusCode: 200..<300)
    .validate(contentType: ["application/json"])
    .responseData { response in
        switch response.result {
        case .success:
            print("----Validation Successful")
        case let .failure(error):
            print(error)
        }
    }



//Response处理
//alamofire有5种响应体：

//1）Response Handler - 不做任何处理，仅仅根据url进行返回：

AF.request("https://httpbin.org/get").response { response in
    debugPrint("Response1: \(response)")
}


//2）Response Data Handler - 通过序列化提取出响应的数据：

AF.request("https://httpbin.org/get").responseData { response in
    debugPrint("Response2: \(response)")
}




//3）Response String Handler - 通过序列化提取出响应的String：

AF.request("https://httpbin.org/get").responseString { response in
    debugPrint("Response3: \(response)")
}


//4）Response Decodable Handler - 通过序列化将Data转换为DataDecoder（类型自己定义），
struct DecodableType: Decodable { let url: String }

AF.request("https://httpbin.org/get").responseDecodable(of: DecodableType.self) { response in
    debugPrint("Response4: \(response)")
}



//10认证
//认证的几种方式：
//1）直接在url种提供：
let user1 = "user"
let password1 = "password"

AF.request("https://httpbin.org/basic-auth/\(user1)/\(password1)")
    .authenticate(username: user1, password: password1)
    .responseDecodable(of: DecodableType.self) { response in
        debugPrint(response)
    }


//2）上面的变体，实例化URLCredential对象：
let user2 = "user"
let password2 = "password"

let credential = URLCredential(user: user2, password: password2, persistence: .forSession)

AF.request("https://httpbin.org/basic-auth/\(user2)/\(password2)")
    .authenticate(with: credential)
    .responseDecodable(of: DecodableType.self) { response in
        debugPrint(response)
    }


//3）手动认证，提高复用，简化代码（不用调用authenticate这个API，看着烦）：

let user = "user"
let password = "password"

let headers5: HTTPHeaders = [.authorization(username: user, password: password)]

AF.request("https://httpbin.org/basic-auth/user/password", headers: headers5)
    .responseDecodable(of: DecodableType.self) { response in
        debugPrint(response)
    }















    

