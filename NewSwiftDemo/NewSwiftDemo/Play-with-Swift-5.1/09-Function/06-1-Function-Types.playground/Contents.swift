//: Playground - noun: a place where people can play

import UIKit

// 函数类型
func add( a:Int , _ b:Int ) -> Int{
    return a + b
}

//传递
let anotherAdd = add
anotherAdd( 3 , 4 )

// let anotherAdd: (Int,Int)->Int = add


// 返回值为空的函数类型
func sayHelloTo(name:String){
    print("Hello, \(name)!")
}

let anotherSayHelloTo: (String) -> () = sayHelloTo
//let anotherSayHelloTo: (String) -> Void = sayHelloTo


// 参数和返回值均为空的函数类型
func sayHello(){
    print("Hello")
}

let anotherSayHello1: ()->() = sayHello
let anotherSayHello2: ()->Void = sayHello


// swift3中，如果函数的传入参数的类型以关键字来声明的话，不管有多少个参数，都必须在两边用括号修饰
// 报错:Single argument function types require parentheses
// swift4中，如果函数不需要有任何参数，则函数的类型的参数部分必须写成()而不是(Void)
// 报错（警告）：When calling this function in Swift 4 or later, you must pass a '()' tuple; did you mean for the input type to be '()'?

let anotherSayHello3: ()->() = sayHello     //swift 4
let anotherSayHello4: ()->Void = sayHello   //swift 4

