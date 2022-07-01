import UIKit

//但有时后台系统使用的命名规则有可能与前端不一致，比如后台字段返回下划线命名法，而一般我们使用驼峰命名法，所以在字段映射的时候就需要修改一下，例如后台返回first_name而不是firstName。
//
//这里有两种解决：
//第一种：实现CodingKey协议进行枚举映射

let json = """
    {
        "first_name": "lichangan",
        "age": 200,
        "description": "A handsome boy."
    }
"""


struct Person : Codable {
    var name:String
    var age:Int
    var description:String
    // 自定义字段属性
    // 注意 1.需要遵守Codingkey  2.每个字段都要枚举
    private enum CodingKeys:String,CodingKey {
        case name = "first_name"
        case age
        case description
    }
}

//JSON转Model
let decoder = JSONDecoder()
if let jsonData = json.data(using: .utf8) {
    do {
        let person = try decoder.decode(Person.self, from: jsonData)
        print(person.name)
    }catch {
        print("JSON解析失败")
    }
}


