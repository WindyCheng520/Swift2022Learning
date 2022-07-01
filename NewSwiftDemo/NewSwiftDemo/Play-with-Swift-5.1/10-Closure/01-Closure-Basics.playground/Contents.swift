//: Playground - noun: a place where people can play

import UIKit

var arr:[Int] = []
for _ in 0..<100{
    //swift3中使用arc4random或者arc4random_uniform方法
    arr.append(Int(arc4random() % 100))   //swift 3
}


// 定义比较函数完成自定义排序
func biggerNumberFirst(a:Int , _ b:Int) -> Bool{
    return a > b
}

//swift 3中sort()的API改成了sorted(by: ) 这点和python比较像
//在这里引用一下慕课网用户"慕大神仙"的解释:
//如果大家使用的是swift3.0版本，那么需要注意：
//而在3.0版本中以上方法被修改为 sorted() sort()
//新版中 sorted()是不会改变原数组的值，而sort()是会改变原数组的值，这点与2.0是不一样的


//传入函数
arr.sorted(by: biggerNumberFirst)   //swift 3


//闭包格式
// { (parameters) -> (return type) in    statements  }

// 使用闭包
arr.sorted(by: {(a: Int, b: Int) -> Bool in
    return a > b
})




//下面写法是错误的
//// 定义比较函数完成自定义排序
//let biggerNumberFirst = {(a:Int , _ b:Int) -> Bool
//    in
//    return a > b
//}
//
//arr.sorted(by:biggerNumberFirst)

//arr.filter(biggerNumberFirst)
