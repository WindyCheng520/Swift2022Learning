import UIKit
import Alamofire

//https://www.jianshu.com/p/b7174ed30901?ivk_sa=1024320u

//下载file
//alamofire支持下载到内存或者硬盘上，下载的文件都会放在一个临时文件夹里，需要及时转移。

//1）基本例子：

AF.download("https://httpbin.org/image/png").responseURL { response in
    // Read file from provided file URL.
}




//2）下载到目的地文件：
//正如前面所说的，所有的文件下载都会放在一个临时区，需要制定destination。提供Destination，会在文件移动到destination之前执行其中的闭包操作，可以指定两种：
//.createIntermediateDirectories：如果指定，则为目标 URL 创建中间目录。
//.removePreviousFile： 如果指定，则从目标 URL 中删除上一个文件。
let destination: DownloadRequest.Destination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("image.png")

    return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
}

AF.download("https://httpbin.org/image/png", to: destination).response { response in
    debugPrint(response)

    if response.error == nil, let imagePath = response.fileURL?.path {
        let image = UIImage(contentsOfFile: imagePath)
        debugPrint(image)
    }
}


//更简单的，直接使用API完成下载操作：
let destination2 = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
AF.download("https://httpbin.org/image/png", to: destination2)


//3）报告下载进度：
//使用downloadProgress API可以向用户报告下载进度。
AF.download("https://httpbin.org/image/png")
    .downloadProgress { progress in
        print("Download Progress: \(progress.fractionCompleted)")
    }
    .responseData { response in
        if let data = response.value {
            let image = UIImage(data: data)
        }
    }



//4）取消和恢复下载:
//取消下载提供了两个API：
//cancel(producingResumeData: Bool)：允许控制是否恢复下载，只能在DownloadResponse上用
//cancel(byProducingResumeData: (_ resumeData: Data?) -> Void)：允许恢复下载，但是只能在完成程序中使用
var resumeData: Data!

let download = AF.download("https://httpbin.org/image/png").responseData { response in
    if let data = response.value {
        let image = UIImage(data: data)
    }
}

// download.cancel(producingResumeData: true) // Makes resumeData available in response only.
download.cancel { data in
    resumeData = data
}

//AF.download(resumingWith: resumeData).responseData { response in
//    if let data = response.value {
//        let image = UIImage(data: data)
//    }
//}



struct Post :Codable,Identifiable{
    let id: Int
    let avatar :String
    let vip: Bool
    let name:String
    let date:String
    var isFollowed : Bool
    let text :String
    let images :[String]
    var commentCoun:Int
    var commentCount:Int
    var likeCount:Int
    var isLiked:Bool
}


struct PostList:Codable {
    var list : [Post]
}





func startLoad(){
        let url =  "https://github.com/xiaoyouxinqing/PostDemo/raw/master/PostDemo/Resources/PostListData_recommend_1.json"
        AF.request(url).responseData{ respone in
            switch respone.result{
            case let .success(data): //如果返回成功则赋值给临时变量 data
                guard let list = try? JSONDecoder().decode(PostList.self, from: data) else{
                 //   self.updateText("Can not parse data")
                    return
                }
              //  self.updateText("Post count\(list.list.count)")
                break
            case let .failure(error):  //如果返回失败则赋值给临时变量 error
              //  self.updateText(error.errorDescription!)
                break
            }
        }
}





