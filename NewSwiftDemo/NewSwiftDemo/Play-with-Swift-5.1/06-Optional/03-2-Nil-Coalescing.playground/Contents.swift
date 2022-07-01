//: Playground - noun: a place where people can play

import UIKit

/*
 对于nil聚合运算符，深入进去其实还有很多有意思的东西值得介绍，欢迎大家阅读我（波波老师）的博文《聊聊swift中的"??"》。如果对于其中的一些东西不理解，可能看完第四季的运算符重载和协议相关，就能理解啦：） http://www.jianshu.com/p/3ede1ec31351
 */

// Nil-Coalescing
var errorMessage: String? = nil

let message: String
if let errorMessage = errorMessage{
    message = errorMessage
}
else{
    message = "No error"
}

// 使用三目运算符
let message2 = errorMessage == nil ? "No error" : errorMessage!
// 注意: 此时使用errorMessage需要强制解包.以保证message2是一个String，而非String?
// 三目运算符?:的实质就是一个if else



// 使用 ??
let message3 = errorMessage ?? "No error"
print(message3)
// 注意: 此时使用errorMessage不需要强制解包. 
// ??符号已经保证了访问到errorMessage时, errorMessage不是nil
// Swift将为我们自动解包, 保证message2永远是一个String, 而不是String?
