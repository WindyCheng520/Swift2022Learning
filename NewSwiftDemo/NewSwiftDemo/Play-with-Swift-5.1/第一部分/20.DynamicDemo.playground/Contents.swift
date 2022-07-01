import UIKit

@dynamicMemberLookup
@dynamicCallable
class CustomData {
    var name:String = ""
    var age:Int = 0
    subscript(dynamicMember member: String) -> String {
        return "unknow"
    }
    subscript(dynamicMember member: String) -> Int {
        return 0
    }
    func dynamicallyCall(withArguments arg:[String]) {
        print("unknow func:\(arg)")
    }
    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Int>) {
        let res = pairs.map {key, value in
                    return "[\(key):\(value)]"
                }.joined(separator: "")
        print(res)
    }
}

let obj = CustomData()
obj("字符串参数","a","b") // unknow func:["字符串参数", "a", "b"]
obj(a:1, b:2) //[a:1][b:2]


print(obj.name)
let str:String = obj.other
let num:Int = obj.num
print(str, num)
