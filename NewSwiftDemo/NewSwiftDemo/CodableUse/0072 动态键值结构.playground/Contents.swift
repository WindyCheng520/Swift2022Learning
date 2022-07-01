import UIKit
//很多时候由于产品功能的需要，Web服务通常会下发动态结构数据，比如下面这段简化的JSON结构：


let res = """
{
    "template":"video",
     "videoFeed":{
         "vid":"1234",
        "url":"http://www.baidu.com",
        "coverPic":"http://www.baidu.com/pic.png"
     },
     "picFeed":{
         "content":"今天天气不错哦",
         "pics":{
                "width":100,
                "height":200
          }
      },
      "linkFeed":{
          "title":"四季沐歌",
          "url":"http://www.google.com"
      }
}
"""


//其中，template代表模版类型，有三种可能video，pic，link；同一个时刻，Web服务只会下发一种数据。
//比如视频模式时：
//{
//    "template":"video",
//     "videoFeed":{
//         "vid":"1234",
//        "url":"http://www.baidu.com",
//        "coverPic":"http://www.baidu.com/pic.png"
//     }
//}

//图文模式时：
//{
//    "template":"pic",
//     "picFeed":{
//         "content":"今天天气不错哦",
//         "pics":{
//                "width":100,
//                "height":200
//          }
//      }
//}

//如果想要处理好这种动态数据结构，那么就必须要重写init方法和encode方法了。
//为了简化问题，这里只实现init方法：

struct Feed:Codable {
    var template:FeedTemplate
    var videoFeed:VideoFeed?
    var picFeed:PicFeed?
    var linkFeed:LinkFeed?
        
    private enum CodingKeys:String,CodingKey{
        case template
        case videoFeed
        case picFeed
        case linkFeed
     }
        
     init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         template = try container.decode(FeedTemplate.self, forKey: .template)
         do {
             videoFeed = try container.decodeIfPresent(VideoFeed.self, forKey: .videoFeed)
         } catch {
             videoFeed = nil
         }
         do {
             picFeed = try container.decodeIfPresent(PicFeed.self, forKey: .picFeed)
         } catch {
             picFeed = nil
         }
         do {
             linkFeed = try container.decodeIfPresent(LinkFeed.self, forKey: .linkFeed)
         } catch {
             linkFeed = nil
         }
     }
}
    
struct VideoFeed:Codable {
     var vid:String
     var url:String
     var coverPic:String
}
    
struct PicFeed:Codable {
     var content:String
     var pics:PicFeedImage
}
    
struct PicFeedImage:Codable{
     var width:Int
     var height:Int
}
    
struct LinkFeed:Codable{
     var title:String
     var url:String
}
    
enum FeedTemplate:String,Codable{
     case FEED_VIDEO = "video"
     case FEED_PIC = "pic"
     case FEED_LINK = "link"
}

//其中，出现了我们之前没有提到的decodeIfPresent方法。当不确定键值是否会存在时，在设置属性时把这个属性设置为可选，然后使用decodeIfPresent这个方法会查找该键值是否存在，如果存在就decode，如果不存在就会返回nil，这样就可以简单处理动态数据结构造成的问题。




