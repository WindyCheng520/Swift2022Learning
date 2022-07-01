//: Playground - noun: a place where people can play

import UIKit


// Optional chaining
var errorMessage: String? = "Not Found"
if let errorMessage = errorMessage{
    //swift2: errorMessage.uppercaseString
    //在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
    errorMessage.uppercased()      //swift3使用uppercased()
}

//swift 2: errorMessage?.uppercaseString
//在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
errorMessage?.uppercased()    //swift3

//swift 2: var uppercaseErrorMessage = errorMessage?.uppercaseString
//在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
var uppercaseErrorMessage = errorMessage?.uppercased()    //swift 3

if let errorMessage = errorMessage?.uppercased(){     //swift3
    errorMessage
}

// Optional chaining 也可以使用!

//let uppercaseErrorMessage2 = errorMessage!.uppercaseString  //swift 2
let uppercaseErrorMessage2 = errorMessage!.uppercased()     //swift3
