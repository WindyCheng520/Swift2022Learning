//: Playground - noun: a place where people can play

import UIKit

var arr:[Int] = []
for _ in 0..<100{
    arr.append(Int(arc4random() % 1000))  //swift 3
}

/*
 由于以下代码在swift3中的改动都差不多: arr.sort()改成arr.sorted(by: )，在这里我直接将下面的代码替换成正确的代码
 swift 3中sort()的API改成了sorted(by: ) 这点和python比较像
 在这里引用一下慕课网用户"慕大神仙"的解释:
 如果大家使用的是swift3.0版本，那么需要注意：
 2.0版本中的方式是 sort() 和 sortInPlace()
 而在3.0版本中以上方法被修改为 sorted() sort()
 新版中 sorted()是不会改变原数组的值，而sort()是会改变原数组的值，这点与2.0是不一样的
 */


// 使用闭包排序
var arr1 = arr.sorted(by: { (a:Int , b:Int) -> Bool in
    return a > b
})


// 闭包内如果只有一行代码，可以放在同一行
arr.sorted(by: { (a:Int , b:Int) -> Bool in return a > b})


// 自动获得参数和返回值类型
arr.sorted(by: { a , b in return a > b})


// 可以省略return关键字
arr.sorted(by: { a , b in a > b})


// 简化参数名
arr.sorted(by: { $0 > $1})


// 符号作为函数
arr.sorted(by: >)
