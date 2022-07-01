//: Playground - noun: a place where people can play

import UIKit


//swift 2: var array1 = []
//swift 3不支持在没有显式地声明数据类型的情况下使用[]。如果想创建一个空的NSArray，则需要声明数据类型

var array1: NSArray = []      //swift 3



var array2 = [1,2,3,4,5] as NSArray
var array3: NSArray = [1,"hello"]


// swift 2: var array4: [NSObject] = [1,"hello"]
// swift3中，由于编译器会自动将"hello"和1推断成Swift.Int和Swift.String，所以在[NSObject]放入元素时会报错

var array4: Array<NSObject> = [1 as NSNumber,"hello" as NSString]    //swift3解决方案
// NextStep - NS
// UserInterface - UI

