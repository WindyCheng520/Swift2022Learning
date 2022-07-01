import UIKit

protocol HSTeacher {
    var name: String{ get set }
}
struct HSPartTimeTeacher: HSTeacher, Codable {
    var name: String
    var partTime: Int?
}
let jsonString = """
{
    "name": "Holo",
    "partTime": 20
}
"""
let jsonData = jsonString.data(using: .utf8)
let decoder = JSONDecoder()
let result = try decoder.decode(HSPartTimeTeacher.self, from: jsonData!)
print(result)// HSPartTimeTeacher(name: "Holo", partTime: Optional(20))
