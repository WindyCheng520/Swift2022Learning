import UIKit
import Alamofire


//上传file
//如果只是少量的数据（比如发送一个数据对象），用request就足够了。但是如果要发送图片之类的，可以使用upload（）
//下面是三个上传file的例子：
//1）

//let data = Data("data".utf8)
//
//AF.upload(data, to: "https://httpbin.org/post").responseDecodable(of: DecodableType.self) { response in
//    debugPrint(response)
//}

//
//let fileURL = Bundle.main.url(forResource: "video", withExtension: "mov")
//
//AF.upload(fileURL, to: "https://httpbin.org/post").responseDecodable(of: DecodableType.self) { response in
//    debugPrint(response)
//}


//AF.upload(multipartFormData: { multipartFormData in
//    multipartFormData.append(Data("one".utf8), withName: "one")
//    multipartFormData.append(Data("two".utf8), withName: "two")
//}, to: "https://httpbin.org/post")
//    .responseDecodable(of: DecodableType.self) { response in
//        debugPrint(response)
//    }


//展示上传进度
//和下载一样，上传也可以展示上传的进度，使用uploadProgress API：
//let fileURL = Bundle.main.url(forResource: "video", withExtension: "mov")
//
//AF.upload(fileURL, to: "https://httpbin.org/post")
//    .uploadProgress { progress in
//        print("Upload Progress: \(progress.fractionCompleted)")
//    }
//    .downloadProgress { progress in
//        print("Download Progress: \(progress.fractionCompleted)")
//    }
//    .responseDecodable(of: DecodableType.self) { response in
//        debugPrint(response)
//    }




