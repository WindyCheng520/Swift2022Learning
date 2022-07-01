//: Playground - noun: a place where people can play

import UIKit

//数字字面量：1.整数字面量
10
0
-800

//2.二进制,前缀 0b
0b10
0b11

//3.十六进制，前缀 0x

0xFF

//浮点型字面量
//十进制，可选的精度部分（）e
3.14159e10

//格式化（补零和千分位/万分位）
60
06
1000_0000_0000.0000_001


//数值类型转换  1.变量与字面量是不同的。 2.超出变量范围的赋值会报错。

//如要进行四则运算，前提：小转大（范围/精度）
let x = 3
let y = 0.14
let z = Double(x) + y

//2.整形转浮点型（精度增加）
let m = 5
let n = Double(m)
n

//浮点型转整形（小数被截断）
let u = 1.414
let w = Int(u)
w

//类型别名：关键字 typealias
         // 优点：更直观
typealias 整型 = Int
typealias 字符串 = String   //不建议给系统的类型起别名

//布尔值 Bool， 只有两个值 true 和 false
//boolean

var 开关状态 = false
var 你是好人 = true


//元祖（Tuple）:多个值的随意组合，临时使用
//定义：圆括号内，各个值以逗号隔开
("小明",300, "黄钻", 30)
//定义时，值前可以加前缀，以冒号隔开
let xiaoming = (user:"小明", account:300, title :"黄钻", age : 30)
//要获取其中某个值，用序号或前缀
xiaoming.user
xiaoming.3
xiaoming.0

//元祖一般用于定义多个变量，或给多个变量同时赋值
var (o, p, q) = (3, 4, 5)
o
p
q

//用于多个变量交换值
(o, p, q) = (p, q, o)
o
p
q






