import UIKit
import Foundation


struct HSTeacher: Codable{
    var name: String
    var className: String
    var courceCycle: Int
}
let jsonString = """
[
    {
        "name": "Holo",
        "className": "Swift",
        "courceCycle": 12
    },{
        "name": "Tom",
        "className": "Object-C",
        "courceCycle": 15
    },{
        "name": "June",
        "className": "Python",
        "courceCycle": 22
    },{
        "name": "Amber",
        "className": "Manager",
        "courceCycle": 22
    }
]
"""
let jsonData = jsonString.data(using: .utf8)
let decoder = JSONDecoder()
if let data = jsonData{
    let result = try? decoder.decode([HSTeacher].self, from: data)
    print(result ?? "解析失败")
}
