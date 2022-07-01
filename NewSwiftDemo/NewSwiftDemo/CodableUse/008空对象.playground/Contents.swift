import UIKit

//在复杂业务场景下，很可能我们需要处理的的数据结构比较复杂，不同的字段key对应相同的数据结构，但是可能有值，也可能只是返回空值，比如有这样两个字段firstFeed和sourceFeed具有相同的JSON结构，但是由于业务需要，在不同场景下firstFeed可能有值（结构与sourceFeed一致），也有可能没有值，返回空对象{}，这时应该如何处理呢？

let json = """
{
    "firstFeed": {},
    "sourceFeed": {
        "feedId": "408255848708594304",
        "title": "整个宇宙的星星都在俯身望你"
     }
}
"""

//需要声明为可选值，才能自动解析
//把SourceFeed的每个属性设置为可选值，这样由于Feed对象中的firstFeed也是可选值，就可以在firstFeed返回空对象{}时，自动解析为nil 。
class SourceFeed: Codable{
    public var feedId: String?
    public var title: String?
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

