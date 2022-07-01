import UIKit

//空值null经常会被服务器返回，如果使用Objective-C，null被默认转换为NSNull，如果没有经过检查类型而进行强制类型转换，很容易造成Crash，Swift语言引入Codable后，可以将可能为null的值的类型设置为可选，这样Codable可以自动将null映射为nil，很容易就解决了这个问题。
//
//还以上面的SourceFeed为例：
let json = """
{
    "firstFeed": null,
    "sourceFeed": {
        "feedId": "408255848708594304",
        "title": "整个宇宙的星星都在俯身望你"
     }
}
"""
class SourceFeed: Codable{
    public var feedId: String
    public var title: String
}

class Feed: Codable {
    public var firstFeed: SourceFeed?
    public var sourceFeed: SourceFeed

}

if let jsonData = json.data(using: .utf8) {
    let decoder = JSONDecoder()
    do {
        let feed = try decoder.decode(Feed.self, from: jsonData)
       
        print(feed.firstFeed)
        print(feed.sourceFeed.feedId)
    }catch{
        print(error.localizedDescription)
    }
}

//如果需要自定义CodingKey,那么null值需要特殊处理
//enum CodingKeys:String,CodingKey {
//       case pictures
//  }
//   
//  init(from decoder: Decoder) throws {
//       let container = try decoder.container(keyedBy: CodingKeys.self)
//
//       do { //处理服务器下发的null
//           let pic:String = try container.decode(String.self, forKey: .pictures)
//       }catch {
//           pictures = nil
//       }
//   }




