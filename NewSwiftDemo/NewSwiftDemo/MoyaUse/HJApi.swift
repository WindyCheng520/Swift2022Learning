//
//  HJApi.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/27.
//

import Foundation
import Moya

public enum HJApi {
   ///随机诗句
   case randomVerse
   ///聚合数据新闻头条
   case new([String: String])
  case sendMobileMsg(String)
  case uploadHeadImage(parameters: [String:Any], imageDate:Data)
}

extension HJApi: TargetType {
  public var baseURL: URL {
      switch self {
      case .randomVerse:
          return URL(string: "https://")!
      default:
          return URL(string: "http://")!
      }
  }
  public var path: String {
      switch self {
      case .randomVerse:
          return "api.apiopen.top/recommendPoetry"
      case .new(_):
          return "v.juhe.cn/toutiao/index"
      case .sendMobileMsg(let msg):
          return "/inf/api/v1/Version/GetVersionUpdateInfo/\(msg)"
      case .uploadHeadImage(parameters: _, imageDate: _):
          return "/file/user/upload.jhtml"
      }
  }
  public var method: Moya.Method {
      switch self {
      case .randomVerse:
          return .get
      default:
          return .post
      }
  }

  public var task: Task {
      switch self {
      case .new(let parameters):
          return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
      case .uploadHeadImage(parameters: let parameters, imageDate: let imgDate):
          let formData = MultipartFormData(provider: .data(imgDate), name: "file",
                                            fileName: "hangge.png", mimeType: "image/png")
          return .uploadCompositeMultipart([formData], urlParameters: parameters)
      default:
          return .requestPlain
      }
  }
  
  public var validationType: ValidationType {
      return .successCodes
  }
  // 用于单元测试
  public var sampleData: Data {
      return "{}".data(using: String.Encoding.utf8)!
  }
  public var headers: [String: String]? {
      return [
          "content-type": "",
//           "platform": "ios",
      ]
  }
}
