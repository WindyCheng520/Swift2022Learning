//: Playground - noun: a place where people can play

import UIKit


// 数组、字典、集合的参数都是按值传递的，因此必须使用inout类型的参数才可以在函数中改变

//swift 2: func initArray( inout arr: [Int] , by value: Int ){
//swift 3中，inout关键字放在了冒号后面（参数类型的前面）。这样做能使整体看起来更舒服：冒号前面都是名字，冒号后面都是和传入参数类型等有关的内容

func initArray(arr: inout [Int] , by value: Int ){     //swift 3
    
    for i in 0..<arr.count{
        arr[i] = value
    }
}

var arr = [1,2,3,4,5]
initArray(arr: &arr, by: 0)    //swift 3
arr


