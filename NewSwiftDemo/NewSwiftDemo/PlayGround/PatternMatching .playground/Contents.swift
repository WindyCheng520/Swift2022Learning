import UIKit

//普通写法

let x = 10
if x > 0 {
    print("positive")
} else if x < 0 {
    print("negative")
} else {
    print("zero")
}

switch x {
case _ where x > 0:
    print("positive")
case _ where x < 0:
    print("negative")
case 0:
    print("zero")
default:
    fatalError("Should be unreachable")
}


//// 伪代码
//switch x {
//case x > 0:
//    print("positive")
//case x< 0:
//    print("negative")
//case x== 0:
//    print("zero")
//}

func greaterThan<T : Comparable>(_ a: T, _ b: T) -> Bool {
    return b > a
}
func lessThan<T : Comparable>(_ a: T ,_ b: T) -> Bool {
    return b < a
}

prefix operator ~>
prefix operator ~<

//prefix func ~> <T : Comparable>(_ a: T,_ b: T) -> Bool {
//    return greaterThan(a, b)
//}
//prefix func ~< <T : Comparable>(_ a: T ,_ b: T) -> Bool {
//    return lessThan(a,b)
//}
//
//switch x {
//case ~>0:
//    print("positive")
//case ~<0:
//    print("negative")
//case 0:
//    print("zero")
//default:
//    fatalError("Should be unreachable")
//}
//
//func isEven<T : IntegerType>(a: T) -> Bool {
//    return a % 2 == 0
//}

//
//func hasPrefix(prefix: String, value: String) -> Bool {
//    return value.hasPrefix(prefix)
//}
//func hasSuffix(suffix: String, value: String) -> Bool {
//    return value.hasSuffix(suffix)
//}
//
//
//let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
//switch str {
//case hasPrefix(prefix:"B", value: str), hasPrefix(prefix:"C", value: str):
//    print("Starts with B or C")
//case hasPrefix("D"):
//    print("Starts with D")
//case hasSuffix("Z"):
//    print("Ends with Z")
//default:
//    print("Something else")
//}
