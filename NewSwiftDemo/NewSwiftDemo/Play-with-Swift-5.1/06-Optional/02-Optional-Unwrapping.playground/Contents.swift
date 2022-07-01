//: Playground - noun: a place where people can play

import UIKit

var errorCode:String? = "404"
print( errorCode )   //这里有warning
//print( errorCode ?? <#default value#> )   //这里有warning

// 可选型不可以直接使用
//"The errorCode is" + errorCode


// 强制解包
"The errorCode is " + errorCode!

// 强制解包是危险的
errorCode = nil
//"The errorCode is" + errorCode!

// 判断不是nil
if errorCode != nil{
    "The errorCode is " + errorCode!
}
else{
    "No error"
}

//在swift3以及以上版本中，也可以这样用。当然，使用if判断也没有问题
print("The errorCode is \(errorCode ?? "no error")")

// if let 解包
if let unwrappedErrorCode = errorCode{
    "The errorCode is " + unwrappedErrorCode
}
else{
    "No error"
}

//// 可以使用相同的变量名
if let errorCode = errorCode{
    "The errorCode is " + errorCode
}
else{
    "No error"
}


// 使用if-let同时解包多个变量
var errorMessage:String? = "Not found"

if let errorCode = errorCode{
    if let errorMessage = errorMessage{
        "The errorCode is " + errorCode + "\nThe errorMessage is " + errorMessage
    }
}

// swift2:
//if let errorCode = errorCode , errorMessage = errorMessage{
//    "The errorCode is " + errorCode + "\nThe errorMessage is " + errorMessage
//在swift3以上的xcode编译器中，直接print()一个可选型参数是会有Warning的。在这种情况下可以使用聚合运算符。
//转载波波老师的post: 对于nil聚合运算符，深入进去其实还有很多有意思的东西值得介绍，欢迎大家阅读我在慕课网的手记《聊聊swift中的"??"》。如果对于其中的一些东西不理解，可能看完第四季的运算符重载和协议相关，就能理解啦：） http://t.imooc.com/article/10325
//reference: https://stackoverflow.com/questions/40691184/expression-implicitly-coerced-from-string-to-any

if let errorCode = errorCode , let errorMessage = errorMessage{
    "The errorCode is " + errorCode + "\nThe errorMessage is " + errorMessage
}


// swift2:
//if let errorCode = errorCode , errorMessage = errorMessage where errorCode == "404"{
//    print("Page not found")
//}
//swift3 中if-case-where中条件判断关键词“where”简化成“，”

if let errorCode = errorCode , let _ = errorMessage, errorCode == "404"{        //swift 3
    print("Page not found")
}





