import Foundation
import Moya

/*
 Moya默认有4个插件分别为：
 AccessTokenPlugin 管理AccessToken的插件
 CredentialsPlugin 管理认证的插件
 NetworkActivityPlugin 管理网络状态的插件
 NetworkLoggerPlugin 管理网络log的插件
 */
// 插件,实现pluginType可以实现在网络请求前转菊花，请求完成结束转菊花，或者写日志等功能
struct NetworkPlugin: PluginType {

    /// Called to modify a request before sending.(可进行数据加密等)
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        print("prepare")
               var mRequest = request
               mRequest.timeoutInterval = 20
        return request
    }
    
    /// Called immediately before a request is sent over the network (or stubbed).（可进行网络等待，loading等）
    func willSend(_ request: RequestType, target: TargetType) {
        print("开始请求")
               // 显示loading
    }

    /// Called after a response has been received, but before the MoyaProvider has invoked its completion handler.（loading结束等）
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        
//        guard case Result.failure(_) = result else {
//                let respons = result.rawValue
//                let dic: Dictionary<String, Any>? = try? JSONSerialization.jsonObject(with: respons!.data, options: .mutableContainers) as! Dictionary<String, Any>
//                
//                if dic != nil {
//                    if dic?.keys.contains("code") == true {
//                        if dic?["code"] as! Int == 700 {
//                            print("Token 失效")
//                        }
//                    }
//                }
//                return
//            }
//            let errorReason: String = (result.error?.errorDescription)!
//            print("请求失败：\(errorReason)")
//            var tip = ""
//            if errorReason.contains("The Internet connection appears to be offline") {
//                tip = "网络不给力，请检查您的网络"
//            }else if errorReason.contains("Could not connect to the server") {
//                tip = "无法连接服务器"
//            }else {
//               tip = "请求失败"
//            }
//            /// 使用tip文字 进行提示
//        }
        
    }

    /// Called to modify a result before completion.(可进行数据解密等)
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        return result
    }

}

