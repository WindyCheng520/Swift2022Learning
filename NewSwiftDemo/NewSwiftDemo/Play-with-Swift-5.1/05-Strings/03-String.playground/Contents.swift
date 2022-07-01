//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Swift"

// 不可以使用[]获取
//str[0]
//str.characters[0]

// startIndex
let startIndex = str.startIndex
startIndex
str[startIndex]

// advancedBy
// 在swift3中，advancedBy函数被取消。
//swift2: str[startIndex.advancedBy(5)]
// 如果想通过一个已有的String.Index通过距离找到其他的String.Index,需要使用String.index(_:offsetBy:)方法
str[str.index(startIndex, offsetBy: 5)]
startIndex

//swift2: let spaceIndex = startIndex.advancedBy(6)
let spaceIndex = str.index(startIndex, offsetBy: 6)
spaceIndex
str[spaceIndex]

// predecessor 和 succesor
// 在swift3中，predecessor 和 succesor方法均被取消
//swift2: str[spaceIndex.predecessor()]
//swift2: str[spaceIndex.successor()]
// 如果想寻找一个String.Index的前驱和后继，需要使用String.index(before:)和String.index(after:)方法
str[str.index(before: spaceIndex)]
str[str.index(after: spaceIndex)]

// endIndex
let endIndex = str.endIndex
//str[endIndex]

//swift2: str[endIndex.predecessor()]
str[str.index(before: endIndex)]

// Range
str[startIndex..<spaceIndex]
//swift2: let range = startIndex..<spaceIndex.predecessor()
let range = startIndex..<str.index(before: spaceIndex)


// 在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。

//swift2: str.replaceRange(range, with: "Hi")
str.replaceSubrange(range, with: "Hi")

//swift2: str.appendContentsOf("!!!")
str.append("!!!")

//swift2: str.insert("?", atIndex: str.endIndex)
str.insert("?", at: str.endIndex)

//swift2: str.removeAtIndex( str.endIndex.predecessor() )
str.remove(at: str.index(before: endIndex))
str

//swift2: str.removeRange( str.endIndex.advancedBy(-2)..<str.endIndex )
str.removeSubrange(str.index(endIndex, offsetBy: -2)..<str.endIndex)


let string = "Hello Swift!"
let slice = string[string.startIndex..<string.index(string.startIndex, offsetBy: 5)]
// "Hello"

let withPartialRange = string[..<string.index(string.startIndex, offsetBy: 5)]
// still "Hello"

let slice1 = string.prefix(5)
// still "Hello"

let slice2 = string.suffix(6)
// still "Hello"

let slice3 = string.dropFirst()

let slice4 = string.dropLast(5)

//Substring 转换为 String
let stringType = String(slice)


//字符串分割示例
let strings = "aaa/bbb/ccc/dddd"
let arraySubstrings: [Substring] = strings.split(separator: "/")

//[Substring]转成[String]
let arrayStrings: [String] = arraySubstrings.compactMap { "\($0)" }
arrayStrings


//完整语法如下
let arrayStrings1: [String] = arraySubstrings.compactMap {
    (item) -> String in
    
    return "\(item)"
}

arrayStrings1








