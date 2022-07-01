//: Playground - noun: a place where people can play

import UIKit

var age: Int? = 17

//在swift3以上的xcode编译器中，直接print()一个可选型参数是会有Warning的。在这种情况下可以使用聚合运算符。
//转载波波老师的post: 对于nil聚合运算符，深入进去其实还有很多有意思的东西值得介绍，欢迎大家阅读我在慕课网的手记《聊聊swift中的"??"》。如果对于其中的一些东西不理解，可能看完第四季的运算符重载和协议相关，就能理解啦：） http://t.imooc.com/article/10325
//reference: https://stackoverflow.com/questions/40691184/expression-implicitly-coerced-from-string-to-any
print(age!)

age = nil
print(age ?? "")      //swift 3


// Optional实际是一个enum

/*更新:
 swift 2:
var website: Optional<String> = Optional.Some("imooc.com")
 swift 3中，Option类下的大部分成员都改名成: 首字母小写+后面单词首字母大写 的形式
 Optional.Some被改名成Optional.some
 Optional.None被改名成Optional.none
 */

var website: Optional<String> = Optional.some("imooc.com")    //swift 3

print(website!)           //swift 3

website = Optional.none     //swift 3

print(website ?? "")     //swift 3


website = .some("imooc.com")    //swift 3
website = .none                 //swift 3

website = "imooc.com"
website = nil


// 从enum的角度看Optional的解包
switch website{
case .none:      //swift 3
    print("No website")
case let .some(website):    //swift 3
    print("The website is \(website)")
}


// Swift为Optional的解包设置的语法
if let website = website{
    print("The website is \(website)")
}
else{
    print("No website")
}

