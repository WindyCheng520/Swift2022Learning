import UIKit


//运算符重载
struct Vector2D {
    var x = 0.0
    var y = 0.0
}

func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
    
}

let v1 = Vector2D(x: 2.0, y: 3.0)
let v2 = Vector2D(x: 1.0, y: 4.0)

let v4 = v1 + v2





precedencegroup DotProductPrecedence {
    associativity: none
    higherThan: MultiplicationPrecedence
    
}

infix operator +*: DotProductPrecedence
func +* (left: Vector2D, right: Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
    
}

let result = v1 +* v2

func incrementor2(variable: Int) -> Int {
    var num = variable
    num += 1
    return num
}

incrementor2(variable: 3)


func incrementor(variable: inout Int) {
    variable += 1
}


var luckyNumber = 7
incrementor(variable: &luckyNumber)
print(luckyNumber)

func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor(variable: inout Int) -> () {
        variable += addNumber;
    }
    return incrementor;
}

let number = makeIncrementor(addNumber: 10)


//字面量表达式
let aNumber = 3
let aString = "Hello"
let aBool = true

let anArray = [1,2,3]
let aDictionary = ["key1": "value1", "key2": "value2"]

enum MyBool: Int {
    case myTrue, myFalse
    
}

extension MyBool: ExpressibleByBooleanLiteral {
    init(booleanLiteral value: Bool) {
        self = value ? .myTrue : .myFalse
    }
}

let myTrue: MyBool = true
let myFalse: MyBool = false


class Person: ExpressibleByStringLiteral {
    let name: String
    init(name value: String) {
        self.name = value
    }
    required convenience init(stringLiteral value: String) {
        self.init(name: value)
        
    }
    required convenience init(extendedGraphemeClusterLiteral value: String) { self.init(name: value)
        
    }
    required convenience init(unicodeScalarLiteral value: String) { self.init(name: value)
        
    }
    
}
let p: Person = "xiaoMing"
print(p.name)
//这是因为在 extension 中，我们是不能定义 required 的初始化⽅法的。



//下标
extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }
        
        set {
            for (index,i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}


var arr = [1,2,3,4,5]
arr[[0,2,3]] //[1,3,4]
arr[[0,2,3]] = [-1,-3,-4]
arr //[-1,2,-3,-4,5]
