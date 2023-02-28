import Foundation
import Moya
import SwiftUI

// NetworkAPI就是一个遵循TargetType协议的枚举
public enum NetworkAPI {
    //测试天气
    case realtimeWeather(cityId:String)
    case login(mobile: String, verifyCode: String)
    
}

extension NetworkAPI: TargetType{
    public var baseURL: URL {
        return URL(string: "https://go.apipost.cn/")!
    }
    
    public var path: String {
        switch self {
        case .realtimeWeather:
            return "?Query=test"
            
        case .login:
            return "/login"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .realtimeWeather:
            return .post
        case .login:
            return .post
        }
    }
    
    public var task: Moya.Task {
        // 公共参数
        var params: [String: Any] = [:]
//        params["token"] = "Gz1qYLXeBW8MZuUfDlr9wsAYuVS1cZFMJY9BbaF842L2gRps747o4w=="
        
        switch self {
        case .realtimeWeather(let cityId):
            params["cityId"] = cityId
        case .login(mobile: let mobile, verifyCode: let verifyCode):
            params["mobile"] = mobile
            params["verifyCode"] = verifyCode
        }
        return .requestParameters(parameters: params, encoding: JSONEncoding.default)
    }
    
    public var headers: [String : String]? {
        var headers: [String: String] = [:]
        
        switch self {
        case .realtimeWeather:
            headers["Content-type"] = "application/json;charset=utf-8"
        case .login:
            headers["Content-type"] = "application/json;charset=utf-8"
        }
        
        return headers
    }
    
}


