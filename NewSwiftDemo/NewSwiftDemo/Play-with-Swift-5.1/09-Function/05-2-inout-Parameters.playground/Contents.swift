//: Playground - noun: a place where people can play

import UIKit

// swift 2: func swapTwoInts( inout a: Int , inout _ b: Int ){
// swift 3中，inout关键字放在了冒号后面（参数类型的前面）。这样做能使整体看起来更舒服：冒号前面都是名字，冒号后面都是和传入参数类型等有关的内容

func swapTwoInts(a: inout Int, b: inout Int){
    
    // 尽量使用let
    //let t:Int = a
    //a = b
    //b = t
    
    (a,b) = (b,a)
}

var a:Int = 1
var b:Int = 2

swapTwoInts(a: &a, b: &b)     //swift 3
a
b

swap(&a, &b)
a
b
