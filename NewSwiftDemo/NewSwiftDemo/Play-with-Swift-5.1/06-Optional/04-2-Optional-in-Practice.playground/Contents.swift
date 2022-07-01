//: Playground - noun: a place where people can play

import UIKit


// Int()
var ageInput: String = "16"

let age = Int(ageInput)

//swift 2: if let age = Int(ageInput) where age < 20{
//swift3 中if-let-where中条件判断关键词“where”简化成“，”
if let age = Int(ageInput), age < 20{    //swift 3
    
    print("You're a teenager!")
}



// Optional in String method
var greetings = "Hello"

// swift 2:
//greetings.rangeOfString("ll")
//greetings.rangeOfString("mm")
//在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。

greetings.range(of: "ll")   //swift 3
greetings.range(of: "mm")

//这里提供一种解包的思路，供大家参考
let rangeOfGreetings = greetings.range(of: "ll")

print(rangeOfGreetings ?? "invalid range")

let range = (upperBound: rangeOfGreetings?.upperBound, lowerBound: rangeOfGreetings?.lowerBound)


