import UIKit

//接下来我们看一种类型，对于这种类型相对之前更复杂，但处理起来也是很简单，日常开发中也是接触最多这种情况：

let res = """
{
    "info": {
        "grade": "3",
        "classes": "1112"
    },
    "students" : [
        {
            "name": "ZhangSan",
            "age": 17,
            "sex": "male",
            "born_in": "China"
        },
        {
            "name": "LiSi",
            "age": 18,
            "sex": "male",
            "born_in": "Japan"
        },
        {
            "name": "WangWu",
            "age": 16,
            "sex": "male",
            "born_in": "USA"
        }
    ]
}
"""


//我们按照老套路一个一个来定制模型其实也是很简单的：
struct Response: Codable {
    let info: Info
    let students: [Student]
    
    struct Info: Codable {
        let grade: String
        let classes: String
    }
    
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
}







if let jsonData = res.data(using: .utf8){
    let decoder = JSONDecoder()
    let ecoder = JSONEncoder()
    do {

        let response = try!  decoder.decode(Response.self, from: jsonData)
        dump(response)
        let responseData =  try! ecoder.encode(response)
        print(responseData)

    }catch {
        print(error.localizedDescription)
    }
}


