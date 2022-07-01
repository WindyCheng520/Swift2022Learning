import UIKit

//https://blog.csdn.net/u010259906/article/details/119748827

//2 Codable的痛点
//只要有一个属性解析失败则直接抛出异常导致整个解析过程失败。
//
//以下情况均会解析失败:
//
//类型不匹配，例如 APP 端是 Int 类型，服务器下发的是 String 类型
//不可选类型键不存在, 例如服务器下发的数据缺少了某个字段
//不可选类型值为 null，例如服务器由于某种原因导致数据为 null
//后两个可以通过使用可选类型避免，第一种情况只能重写协议方法来规避，但是很难完全避免。而使用可选类型势必会有大量的可选绑定，对于 enum 和 Bool 来说使用可选类型是非常痛苦的，而且这些都会增加代码量。这时候就需要一种解决方案来解决这些痛点。


let json = """
    {
        "firstName": "lichangan",
        "age": 200,
        "description": "A handsome boy."
    }
"""


struct Person : Codable {
    var firstName:String
    var age:Int
    var description:String
}


let decoder = JSONDecoder()
if let jsonData = json.data(using: .utf8) {
    do {
        let person = try decoder.decode(Person.self, from: jsonData)
        print(person.firstName)
    }catch {
        print("JSON解析失败")
    }
}


