//: Playground - noun: a place where people can play

import UIKit


// 有一个默认参数
//func sayHelloTo( name: String , withGreetingWord greeting: String = "Hello" ) -> String{
//    
//    return "\(greeting), \(name)!"
//}
//
//sayHelloTo("Playground", withGreetingWord: "Hi")
//sayHelloTo("Playground")


// 有多个默认参数
func sayHelloTo( name: String , withGreetingWord greeting: String = "Hello" , punctuation: String = "!") -> String{
    
    return "\(greeting), \(name)\(punctuation)"
}

sayHelloTo(name: "Playground", withGreetingWord: "Hi", punctuation: "!!!")   //swift 3

// 默认参数顺序变更是可以的，但最好和声明序一样

// swift3中，参数的传入顺序必须和声明的顺序一致，即使显式地声明了参数名称
// swift 3报错：argument 'to' must precede argument 'punctuation'




//sayHelloTo(name: "Playground", punctuation: "!!!", withGreetingWord: "Hi")      //swift 3

sayHelloTo(name: "Playground", withGreetingWord: "Hi", punctuation: "!!!")      //swift 4


// 最好将默认参数放在最后, 但不是必须


// 第一个参数含有默认参数值
func sayHello( to name: String = "Playground" , withGreetingWord greeting: String = "Hello" , punctuation: String = "!") -> String{
    
    return "\(greeting), \(name)\(punctuation)"
}

sayHello()
//sayHello(punctuation: "!!!", withGreetingWord: "Bye", to: "OC")     //同理，参数的传入顺序必须和声明时的顺序一样
sayHello(to: "OC", withGreetingWord: "Bye", punctuation: "!!!")


// print是一个非常好的有两个默认参数的函数
print("Hello", 1, 2, 3, separator:",", terminator:".")
