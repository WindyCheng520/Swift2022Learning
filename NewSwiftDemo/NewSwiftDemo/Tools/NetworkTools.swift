//
//  NetworkTools.swift
//  Alamofire的测试
//
//  Created by 1 on 16/9/19.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit
import Alamofire
import Moya

enum MethodType {
    case get
    case post
}

class NetworkTools {
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
//        let headers: HTTPHeaders = [
//           // HTTPHeader(name: "Authorization", value: "Basic VXNlcm5hbWU6UGFzc3dvcmQ="),
//            HTTPHeader(name: "Accept", value: "application/json")
//        ]
//        
//        AF.request("https://httpbin.org/get", requestModifier: { $0.timeoutInterval = 5 }).response { (response) in
//        }
        
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                AF.request(URLString, method: method, parameters: jsonString, encoder: URLEncoding.default as! ParameterEncoder, headers: nil, interceptor: nil, requestModifier: nil).validate().responseJSON {/* [weak self] */(response) in
                    
                    
                }
            }
        }
        
//        AF.request(URLString, method: method, parameters: json, encoder: URLEncoding.default as! ParameterEncoder, headers: nil, interceptor: nil, requestModifier: nil).validate().responseJSON { [weak self] (response) in
//        }
        

        
//        AF.request(URLString, method: method, parameters: parameters, encoder: JSONParameterEncoder.default, headers: nil, interceptor: nil, requestModifier: nil).response { response in
//
////            switch response.result{
////            case .success(_):
//
//            // 4.将结果回调出去
//            finishedCallback(response.result)
//        }
        
        // 2.发送网络请求
//        AF.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
//
//            // 3.获取结果
//            guard let result = response.result.value else {
//                print(response.result.error ?? "")
//                return
//            }
//
//            // 4.将结果回调出去
//            finishedCallback(result)
//        }
    }
}


extension NetworkTools {
    
    struct EncodableParameters: Encodable {
        var list: [[String : String]] = []
//        var page: String?
//        var pageSize: String?
    }
    
}



//https://github.com/Alamofire/Alamofire/blob/266919c5121bf94e2bde9a290aeb12017a9eaa73/Documentation/Usage.md


//struct Login: Encodable {
//    let email: String
//    let password: String
//}
//
//let login = Login(email: "test@test.test", password: "testPassword")
//
//AF.request("https://httpbin.org/post",
//           method: .post,
//           parameters: login,
//           encoder: JSONParameterEncoder.default).response { response in
//    debugPrint(response)
//}
