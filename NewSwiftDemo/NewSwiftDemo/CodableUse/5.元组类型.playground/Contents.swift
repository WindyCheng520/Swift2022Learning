import UIKit
import Foundation


//比如我们有一个坐标，location : [20, 10]，当我们在使用Codable进行解析的过程中，我们需要进行如下操作：

struct Location: Codable {
    var x: Double
    var y: Double
    init(from decoder: Decoder) throws{
        //unkeyedContainer表示不解析当前的x、y
        var contaioner = try decoder.unkeyedContainer()
        //而是将contaioner中x、y的value值赋值给当前
        self.x = try contaioner.decode(Double.self)
        self.y = try contaioner.decode(Double.self)
    }
}
struct RawSeverResponse: Codable{
    var location: Location
}
let jsonString = """
{
    "location": [20, 10]
}
"""
let jsonData = jsonString.data(using: .utf8)
let decoder = JSONDecoder()
let result = try decoder.decode(RawSeverResponse.self, from: jsonData!)
print("\((result.location.x,result.location.y))") //(20.0, 10.0)

//其中用到的 unkeyedContainer() 表示忽略当前容器的key值、不解析为 x:20.0, y:10.0这种格式、而是重新定义了一个数据类型结构体RawSeverResponse来解析数据、从而将获取到的数据赋值其中。
