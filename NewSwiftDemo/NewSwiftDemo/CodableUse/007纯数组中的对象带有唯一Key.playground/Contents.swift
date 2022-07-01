import UIKit

//如果数据是由多个字典组成的数组，字典里又有一组键值对，这种格式可以看成是前两种的组合：
let res = """
[
    {
        "student": {
            "name": "ZhangSan",
            "age": 17,
            "sex": "male",
            "born_in": "China"
        }
    },
    {
        "student": {
            "name": "LiSi",
            "age": 18,
            "sex": "male",
            "born_in": "Japan"
        }
    },
    {
        "student": {
            "name": "WangWu",
            "age": 16,
            "sex": "male",
            "born_in": "USA"
        }
    }
]
"""

//解析这种数据，我们像第二种方式一样，对于外围的数组我们只需要在内层的类型中加上一个中括号就可以了，而里面的类型这里我们需要定义成Dictionary<String, Student>：
struct Student: Codable {
    let name: String
    let age: Int
    let sex: SexType
    let bornIn: String
    
    enum SexType: String, Codable {
        case male
        case female
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case sex
        case bornIn = "born_in"
    }
}





if let jsonData = res.data(using: .utf8){
    let decoder = JSONDecoder()
    let ecoder = JSONEncoder()
    do {

        let stu = try! decoder.decode([Dictionary<String, Student>].self, from: jsonData)
        dump(stu)
        let stuData =  try! ecoder.encode(stu)


    }catch {
        print(error.localizedDescription)
    }
}




