import UIKit

//但有时后台系统使用的命名规则有可能与前端不一致，比如后台字段返回下划线命名法，而一般我们使用驼峰命名法，所以在字段映射的时候就需要修改一下，例如后台返回first_name而不是firstName。

//第二种解决方案：通过Decoder的keyDecodingStrategy属性， 将属性的值设置为convertFromSnakeCase，就是将编码策略设置为可将驼峰命名法转化为下划线,这样我们就不需要写额外的代码处理了，该属性是Swift4.1之后推出的。


//定义JSON数据
let json = """
    {
        "first_name": "lichangan",
        "age": 200,
        "description": "A handsome boy."
    }
"""


struct Person : Codable {
    var firstName:String
    var age:Int
    var description:String
}
//JSON转Model
let decoder = JSONDecoder()
// 编码策略  使用从蛇形转化为大写 encode时同样也可将驼峰命名法转化为下划线
decoder.keyDecodingStrategy = .convertFromSnakeCase
if let jsonData = json.data(using: .utf8) {
    do {
        let person = try decoder.decode(Person.self, from: jsonData)
        print(person.firstName)
    }catch {
        print("JSON解析失败")
    }
}



////还支持自定义转化规则
//let json1 = """
//    {
//        "First_name": "米饭童鞋",
//        "Points": 200,
//        "Pescription": "A handsome boy."
//    }
//"""
//
//let decoder1 = JSONDecoder()
//// 自定义转化规则
// decoder1.keyDecodingStrategy = .custom({ (keys) -> CodingKey in
//             let lastKey = keys.last!
//             guard lastKey.intValue == nil else { return lastKey }
//             // 将首字母大写的转化为小写的
//             let stringValue = lastKey.stringValue.prefix(1).lowercased() + lastKey.stringValue.dropFirst()
//             return AnyKey(stringValue: stringValue)!
//  })







