//: Playground - noun: a place where people can play

import UIKit

// 特殊字符: \0 \\t \n \r " ' \u{n}

let a = "Hello world"
print(a)

"\u{515c}"  //unicode 编码

"\u{4e8b}"

//字符串计数: 使用字符串characters属性的count属性来获取字符个数
let c = "小波说雨燕abc!!!"
c.count

//修改字符串.通过字符串的各种方法和属性,其中一种方法是索引
//字符串索引: 索引对应其中每一个字符的位置

let x = "小波说雨燕 之 Swift 3.0,花川学院首发"
x.startIndex
x.endIndex
//确定索引后,用下标来访问相应的字符
x[x.startIndex]
//x[x.endIndex]   //不能通过下表访问末位字符
//before 和 after 代表前一个和后一个索引
x[x.index(before: x.endIndex)]


x[x.index(after: x.startIndex)]  //开始索引的后一个
x[x.index(before:(x.index(after: x.startIndex)))]   //开始索引的后一个的前一个
x[x.index(after:(x.index(before:(x.index(after: x.startIndex)))))]
x[x.index(before:(x.index(after:(x.index(before:(x.index(after: x.startIndex)))))))]

//使用索引的 offsetBy 方法向前进位
x[x.index(x.startIndex, offsetBy: 3)]   //正3表示前进
x[x.index(x.endIndex, offsetBy: -2)]     //负 2 表示后退

//字符串的character属性的indices属性表示索引的区间
for k in x.indices{
    print(k)
}

for k in x.indices{
    print(x[k])
}

for k in x.indices{
    print(x[k],separator: "----", terminator: "")
}

//修改字符串- 插入和删除
var ab = "小波说雨燕"
ab.insert("!", at: ab.endIndex)    //insert

let bc = "之Swift3.0"

ab.insert(contentsOf: bc, at: ab.index(before: ab.endIndex))  //ab.endIndex


//删除一个指定索引的字符,用removAtIndex方法
ab.remove(at: ab.index(before: ab.endIndex))
ab      //感叹号被删除

//删除一个范围的子串,用removeRange方法

let range = ab.index(ab.endIndex, offsetBy: (-(bc.count)))..<ab.endIndex
ab.removeSubrange(range)
ab


//比较字符串 Swift 提供3种方法比较字符串值: 字符串和字符串相等
//前缀相等
//后缀相等

//字符串和字符串相等性:用 == 或 != 操作符
//Unicode扩展组合而成的字符与正式单个字符被视为相等
let A = "\u{1112}\u{1161}\u{11ab}"
"\u{1112}"
"\u{1161}"
"\u{11ab}"
let B = "\u{d55c}"
A == B

//但不同语义的Unicode字符实不相等的.比如英语的A和俄文的A
//虽然相似,但语义不同,不能视为相等
//中文的 "对" 和日文 的"对"(又上多一点)虽然语义相同,字形明显不同

//前缀后后缀相等: 用于检查一个字符串是否具有特定的前缀和后缀
//hasPrefix 和 hasSuffix
let C = "小波说雨燕之 Swift 2"
let D = "小波说雨燕之 iOS9 闪电开发!"
let E = "小波说雨燕"
let F = "!"

C.hasPrefix(E)
D.hasPrefix(E)

C.hasSuffix(F)
D.hasSuffix(F)











