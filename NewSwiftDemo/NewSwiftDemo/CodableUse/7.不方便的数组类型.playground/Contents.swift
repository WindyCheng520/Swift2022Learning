import UIKit



//比如后台将明显的数组类型的数据、以字典的形式返回、那么我们在解析的过程中需要将其转换成数组。
struct HSPerson: Decodable{
    let elements: [String]
    enum CodingKeys: String, CaseIterable, CodingKey {
        case item0 = "item.0"
        case item1 = "item.1"
        case item2 = "item.2"
        case item3 = "item.3"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var element: [String]  = []
        //遍历container，然后装入到集合当中
        for item in CodingKeys.allCases{
            guard container.contains(item) else { break }
            element.append(try container.decode(String.self, forKey: item))
        }
        self.elements = element
    }
}
let jsonString = """
{
    "item.3": "Holo",
    "item.0": "June",
    "item.2": "Amber",
    "item.1": "Winning"
}
"""
let jsonData = jsonString.data(using: .utf8)
let decoder = JSONDecoder()
let result = try decoder.decode(HSPerson.self, from: jsonData!)
print(result) //LPerson(elements: ["June", "Winning", "Amber", "Holo"])
