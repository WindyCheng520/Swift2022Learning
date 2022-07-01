//: Playground - noun: a place where people can play

import UIKit

struct Vector3{
    
    var x:Double = 0.0
    var y:Double = 0.0
    var z:Double = 0.0
    
    subscript(index:Int) -> Double?{
        
        get{
            switch index{
            case 0: return x
            case 1: return y
            case 2: return z
            default: return nil
            }
        }
        
        set{
            guard let newValue = newValue else{ return }
            
            switch index{
            case 0: x = newValue
            case 1: y = newValue
            case 2: z = newValue
            default: return
            }
        }
    }
    
    subscript(axis:String) -> Double?{
        
        get{
            switch axis{
            case "x","X": return x
            case "y","Y": return y
            case "z","Z": return z
            default: return nil
            }
        }
        
        set{
            guard let newValue = newValue else{ return }
            
            switch axis{
            case "x","X": x = newValue
            case "y","Y": y = newValue
            case "z","Z": z = newValue
            default: return
            }
        }
    }
    
    func length() -> Double{
        return sqrt( x*x + y*y + z*z )
    }
}

func + (left: Vector3, right: Vector3) -> Vector3{
    return Vector3(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
}

func - (left: Vector3, right: Vector3) -> Vector3{
    return Vector3(x: left.x - right.x, y: left.y - right.y, z: left.z - right.z)
}

func * (left: Vector3, right: Vector3) -> Double{
    return left.x * right.x + left.y * right.y + left.z * right.z
}

func * (left: Vector3, a: Double) -> Vector3{
    return Vector3(x: left.x * a, y: left.y * a, z: left.z * a)
}

//func += (inout left: Vector3, right: Vector3){      //swift 2
func += (left: inout Vector3, right: inout Vector3){  //swift 2
    left = left + right
}


// Custom operators can begin with one of the ASCII characters /, =, -, +, !, *, %, <, >, &, |, ^, or ~, or with one of the Unicode characters

// https://developer.apple.com/library/ios/documentation/Swift/Reference/Swift_StandardLibrary_Operators/index.html#//apple_ref/doc/uid/TP40016054


//swift 3/4中，在声明对运算符重载进行修饰的时候，两个大括号的表达方法已经被弃用了。instead, 使用precedencegroup这样的关键字进行修饰。
//例子：
//precedencegroup NameOfTheCustomOperator      //创建一个precedencegroup, 后面随便写上一个名字
//{
//    associativity: left                      //这里可以写left, right
//    higherThan: MultiplicationPrecedence     //这里不是像之前那样写数字了，而是使用higherThan，lowerThan关键字对自定义运算符的运算符优先级进行修饰。
//    //lowerThan: AdditionPrecedence
//    //注：这里写的MultiplicationPrecedence，AdditionPrecedence都只是Precedence的一个小部分，具体还有什么其他的Precedence大家可以查阅一下资料
//}
//postfix operator ^^>: NameOfTheCustomOperator       //用创建好的precedencegroup进行修饰

//这块内容的改动还是比较大的，大家可以参考https://www.raywenderlich.com/157556/overloading-custom-operators-swift这篇文章

postfix operator +++          //swift 3
postfix func +++ (vector: inout Vector3) -> Vector3{     //swift 3
    var addOn = Vector3(x: 1.0, y: 1.0, z: 1.0)
    vector += addOn
    return vector
}


prefix operator +++          //swift 3

prefix func +++ (vector: inout Vector3) -> Vector3{        //swift 3
    
    let ret = vector
    var addOn = Vector3(x: 1.0, y: 1.0, z: 1.0)
    vector += addOn
    return ret
}

infix operator ^          //swift 3
//infix operator ^ {associativity left precedence 140}
func ^ (left: Vector3, right: Vector3) -> Double{
    
    return acos( ( left * right ) / (left.length() * right.length()) )
}

let va = Vector3(x: 1.0, y: 2.0, z: 3.0)
let vb = Vector3(x: 4.0, y: 5.0, z: 6.0)
va ^ vb


// 关于precedence
// https://developer.apple.com/library/mac/documentation/Swift/Reference/Swift_StandardLibrary_Operators/index.html#//apple_ref/doc/uid/TP40016054


//swift 2: infix operator **{associativity right precedence 155}
//swift 3/4中，在声明对运算符重载进行修饰的时候，两个大括号的表达方法已经被弃用了。instead, 使用precedencegroup这样的关键字进行修饰。
//例子：
//precedencegroup NameOfTheCustomOperator      //创建一个precedencegroup, 后面随便写上一个名字
//{
//    associativity: left                      //这里可以写left, right
//    higherThan: MultiplicationPrecedence     //这里不是像之前那样写数字了，而是使用higherThan，lowerThan关键字对自定义运算符的运算符优先级进行修饰。
//    //lowerThan: AdditionPrecedence
//    //注：这里写的MultiplicationPrecedence，AdditionPrecedence都只是Precedence的一个小部分，具体还有什么其他的Precedence大家可以查阅一下资料
//}
//postfix operator ^^>: NameOfTheCustomOperator       //用创建好的precedencegroup进行修饰

//这块内容的改动还是比较大的，大家可以参考https://www.raywenderlich.com/157556/overloading-custom-operators-swift这篇文章

//swift 3:
precedencegroup ExponentPrecedence{
    associativity: left
    higherThan: MultiplicationPrecedence
}
infix operator **: ExponentPrecedence
func **(x: Double, p:Double) -> Double{
    return pow(x,p)
}


2 ** 3
2 ** 3 ** 2
1 + 2 ** 3 ** 2
5 * 2 ** 3 ** 2
