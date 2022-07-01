import UIKit

let json = """
{
    "name": "lichangan",
    "sex":1,
    "use": "to buy a new collection of clothes to stock her shop before the holidays.",
    "loan_amount": 150
   
}
"""

enum Sex:Int,Codable {
    case unknow = 1 //未知
    case man = 2 //男
    case female = 3 //女
}

struct Person : Codable {
    var name:String
    var sex:Sex
    var use:String
    var amount:Int
    
    enum CodingKeys:String,CodingKey {
        case name
        case sex
        case use
        case amount = "loan_amount"
    }
}

if let jsonData = json.data(using: .utf8) {
    let decoder = JSONDecoder()
    do {
        let person = try decoder.decode(Person.self, from: jsonData)
        print(person.sex)
    }catch{
        print(error.localizedDescription)
    }
}

//但是这样做要求服务端返回的状态码，必须是客户端已枚举的。假如返回的状态码不是已知的：
//比如服务器性别返回0，那么decode 这一步就会得到一个 DecodingError，类型是 .dataCorrupted，描述是：
//Cannot initialize Code from invalid String value account_not_exist*

//也就是说，只要是未知的字符串，我们都无法解析。甚至还需要根据 DecodingError 提供的 context 来单独处理这种情况。
//
//有后备 case 的 Enum
//或者我们也可以让 Sex这个 Enum 自动处理未知情况。
//声明一个协议，叫 CodableEnumeration：

protocol CodableEnumeration: RawRepresentable, Codable where RawValue: Codable {
    static var defaultCase: Self { get }
}

//通过 extension，让协议提供默认 Decode 方法：

extension CodableEnumeration {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            let decoded = try container.decode(RawValue.self)
            self = Self.init(rawValue: decoded) ?? Self.defaultCase
        } catch {
            self = Self.defaultCase
        }
    }
}

//让 Sex遵从这个协议：

////MARK:性别
//enum Sex:Int,Codable,CodableEnumeration {
//    case unknow = 1 //未知
//    case man = 2 //男
//    case female = 3 //女
//    
//    static var defaultCase: Sex { //异常处理，如果出现了1、2、3之外的数字，性别默认是unknow
//        return .unknow
//    }
//}





