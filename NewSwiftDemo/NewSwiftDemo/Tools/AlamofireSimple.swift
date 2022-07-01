//
//  AlamofireSimple.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import Foundation
import Alamofire


let weatherUrl:String = "http://weatherapi.market.xiaomi.com/wtr-v2/temp/realtime?cityId="

func getWeatherInfo() -> Void {
    let parameters = ["cityId":"101040100"]
    
//    AF.request(<#T##convertible: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>)
//    
//    AF.request(weatherUrl,method:.get,parameters:parameters,encoding: URLEncoding.default).responseDecodable(completionHandler: { (response) in
//        switch response.result {
//        case .success(let json ):
//            let jsonDic = json as? NSDictionary
//            print(jsonDic! as NSDictionary);
//           // self.showAlert(weatherDic: jsonDic!)
//            
//            break
//        case .failure(let error):
//            print("error:\(error)")
//            break
//        }
//    }
}
