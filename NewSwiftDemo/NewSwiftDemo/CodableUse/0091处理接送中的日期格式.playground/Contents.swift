import UIKit


struct Student: Codable {
    let registerTime: Date
    
    enum CodingKeys: String, CodingKey {
        case registerTime = "register_time"
    }
}


//如果我们不想时间以浮点数的形式来出现，我们可以对encoder的dateEncodingStrategy属性进行一些设置：
//encoder.dateEncodingStrategy = .iso8601
//// "register_time" : "2017-11-13T06:48:40Z"
///
/////let formatter = DateFormatter()
//formatter.dateFormat = "MMM-dd-yyyy HH:mm:ss zzz"
//encoder.dateEncodingStrategy = .formatted(formatter)
//// "register_time" : "Nov-13-2017 14:55:30 GMT+8"


