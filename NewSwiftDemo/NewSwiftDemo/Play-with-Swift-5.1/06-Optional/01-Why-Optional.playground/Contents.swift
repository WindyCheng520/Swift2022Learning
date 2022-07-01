//: Playground - noun: a place where people can play

import UIKit

// 使用特殊值作为“无”可能产生歧义
//var errorCode = 404
//errorCode = 0


// 使用可选型
var errorCode:Int? = 404

//swift2:
// print( errorCode )
//
// errorCode = nil
// print( errorCode )

//在swift3以上的xcode编译器中，直接print()一个可选型参数是会有Warning的。在这种情况下可以使用聚合运算符。
//转载波波老师的post: 对于nil聚合运算符，深入进去其实还有很多有意思的东西值得介绍，欢迎大家阅读我在慕课网的手记《聊聊swift中的"??"》。如果对于其中的一些东西不理解，可能看完第四季的运算符重载和协议相关，就能理解啦：） http://t.imooc.com/article/10325
//reference: https://stackoverflow.com/questions/40691184/expression-implicitly-coerced-from-string-to-any

print(errorCode ?? "errorCode value is nil")   //swift 3

errorCode = nil
print(errorCode ?? "errorCode value is nil")


var color: UIColor? = nil


// Int? 和 Int 不是一种类型
let imInt = 405
errorCode = imInt
//imInt = errorCode




// 必须显示地声明可选型的类型
//var imOptional = nil
var imOptional: String? = nil
