import UIKit
import Foundation


struct HSTeacher: Codable{
    var name: String
    var className: String
    var courceCycle: Int
    var personInfo: [PersonInfo]
}
extension HSTeacher {
    struct PersonInfo: Codable {
        var age: Int
        var height: Double
    }
}
let jsonString = """
{
    "name": "Holo",
    "className": "Swift",
    "courceCycle": 10,
    "personInfo": [
        {
           "age": 18,
           "height": 1.85
        },{
           "age": 20,
           "height": 1.75
        }
    ]
}
"""
let jsonData = jsonString.data(using: .utf8)
let decoder = JSONDecoder()
if let data = jsonData{
    let result = try? decoder.decode(HSTeacher.self, from: data)
    print(result ?? "解析失败")
}
