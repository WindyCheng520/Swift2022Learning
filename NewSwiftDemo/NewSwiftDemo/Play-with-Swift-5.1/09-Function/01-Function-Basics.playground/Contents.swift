//: Playground - noun: a place where people can play

import UIKit

// 函数的基本构建
func sayHelloTo( name: String ) -> String{
    return "Hello " + name
}


//swift3中函数的第一参数名在调用的时候须显示,如果显示的声明函数第一个参数名不需要的话也是可以的
//省略第一个参数名的方法：swift3 中，使用_(下划线)显示的声明第一个参数可以省略，在调用的时候可以省略第一个参数名

sayHelloTo(name: "bobo")    //swift 3


// 函数参数中包含可选型
func sayHelloTo( name: String? ) -> String{
    return "Hello " + (name ?? "Guest")
}

var nickname: String?
sayHelloTo(name: nickname)

// 没有参数与没有返回值的函数
func printHello(){
    print("Hello")
}

// func printHello() -> ()
// func printHello() -> Void


// 函数命名

// 语意明确很简单
var arr = [1,2,3]
arr.append(4)
arr.contains(2)

// 蕴含是否有参数

//在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
arr.firstIndex(of: 3)    //swift 3

// 甚至蕴含参数的类型
arr.remove(at: 0)          //swift 3
//arr.removeRange(0..<2)   //swift 2, 'removeRange' has been renamed to 'removeSubrange'
arr.removeSubrange(0..<2)  //swift 3

// 甚至蕴含返回值
var str: NSString = "    Hello   !"

//swift 2: str.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " !"))
//在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
str.trimmingCharacters(in: CharacterSet(charactersIn: "!"))     //swift 3
