import UIKit

class HSTeacher: Codable {
    var name: String?
}
class HSPartTimeTeacher: HSTeacher {
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
print(result.name)    // Optional("Holo")
