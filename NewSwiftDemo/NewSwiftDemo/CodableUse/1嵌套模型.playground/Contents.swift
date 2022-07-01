import UIKit
import Foundation


//1、嵌套模型
struct HSTeacher: Codable{
    var name: String
    var className: String
    var courceCycle: Int
    var personInfo: PersonInfo
}
extension HSTeacher {
    struct PersonInfo: Codable { //需要遵循Codable协议、否则需要实现解码协议方法 init(from decoder: Decoder) throws
        var age: Int
        var height: Double
    }
}
let jsonString = """
{
    "name": "Holo",
    "className": "Swift",
    "courceCycle": 10,
    "personInfo": {
        "age": 18,
        "height": 1.85
     }
}
"""
let jsonData = jsonString.data(using: .utf8)    //JSONString 数据转换为 Data
let decoder = JSONDecoder()            //创建解码器
if let data = jsonData{                //非空判断
    /*
    1、指定当前解码对象类型 HSTeacher
    2、指定解码对象数据     data
    */
    let result = try? decoder.decode(HSTeacher.self, from: data)//断点
    print(result ?? "解析失败")
}

//如此可见、只要遵循我们的Codable协议、那么就能正常的将我们的JSON数据、解码成为我们想要的数据类型。



//2、JSON数据中包含数组
