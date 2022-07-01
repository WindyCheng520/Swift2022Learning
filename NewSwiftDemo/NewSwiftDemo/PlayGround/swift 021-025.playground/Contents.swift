//: Playground - noun: a place where people can play

import UIKit

//区间操作符:一般用于循环运算的范围制定

//闭区间  a...b
1...100

for x in 1...100{
    print(x)
}

var 结果 = 0
for x in 1...100{
    结果 += x
}
结果

//半开区间 a..< b

1..<101

//逻辑操作符 用于修改或组合布尔值
// 非 !:对布尔值取反
// 与 &&: 布尔值组合
// 或 ||: 布尔值组合
//用括号来名示操作优先级,让代码更易读

let (高, 大, 上) = (true, false, true)

//字符串 和 字符
//swift 用Sting表示字符串类型.它是 Character 类型值的集合
//两个字符串可以通过 + 来拼接
//可以通过字符串插值来组合常量/变量/字面量/表达式成一个长字符串

//字符串字面量
""
"中国人"
let a = ""
a.isEmpty //判断字符串是否为空

//字符   用Character定义字符串
let k : Character = "A"
let b : Character = "张"

//可以对一个字符串的character属性进行循环,来访问其单个字符
let m = "学习swift"
for x in m{
    print("字符串遍历:\(x)")
}

//连接字符串  用 + 或 +=
var u = "小波"
var v = "2016说雨燕"
var w = u + v
u += v

//字符串添加字符用 append
var d: Character = "!"
u.append(d)

//字符串插值: 组合常量/变量/字面量/表达式成为一个长字符串
let name = "小波"
let time = "2016年1月8号"
let car = "G"
let 车次 = 5603
let 票价 = 15.5
let 单程 = false

let 订票提示 = "旅客\(name)先生, 您在\(time)订购了\(car)\(车次), 单程票价是\(票价)元的往返.一共需要支付\(票价 * 2)元."




