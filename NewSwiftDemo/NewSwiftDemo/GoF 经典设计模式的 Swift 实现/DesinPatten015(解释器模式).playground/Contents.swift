import UIKit

//Interpreter 解释器模式
//有了解释器，Skyrim的龙语也不在话下。

//官方定义
//
//给定一个语言，定义它的文法表示，并定义一个解释器，这个解释器使用该标识来解释语言中的句子。

//我们可以实现一个能计算文本“1加1”的解释器。

protocol Expression {
    func evaluate(_ context: String) -> Int
}

struct MyAdditionExpression: Expression {
    func evaluate(_ context: String) -> Int {
        return context.components(separatedBy: "加")
            .compactMap { Int($0) }
            .reduce(0, +)
    }
}

let c = MyAdditionExpression()
c.evaluate("1加1") // OUTPUT: 2







//dmeo2
import Foundation

//定义一种新的语法，用字符表示，解释"1+2"这个字符串的含义

protocol Interpreter {
//返回一个泛型Result
    static func interpreter<Result>(input: String) -> Result
}

//整型解释器
struct IntInterpreter: Interpreter {
    internal static func interpreter<Result>(input: String) -> Result {
        let arr = input.components(separatedBy: "+")
        return (Int(arr.first!)! + Int(arr.last!)!) as! Result
    }
}

//字符解析器
struct StringInterpreter: Interpreter {
    internal static func interpreter<Result>(input: String) -> Result {
        let arr = input.components(separatedBy: "+")
        return (arr.first! + arr.last!) as! Result
    }
}

let result: Int = IntInterpreter.interpreter(input: "14+14")
print(result)//28
let result2: String = StringInterpreter.interpreter(input: "14+14")
print(result2)//1414

