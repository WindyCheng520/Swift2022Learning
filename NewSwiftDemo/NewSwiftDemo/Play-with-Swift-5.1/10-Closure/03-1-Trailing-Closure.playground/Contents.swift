//: Playground - noun: a place where people can play

import UIKit

var arr:[Int] = []
for _ in 0..<10{
    arr.append(Int(arc4random() % 1000))   //swift 3
}

/*
 由于以下代码在swift3中的改动都差不多: arr.sort()改成arr.sorted(by: )，在这里我直接将下面的代码替换成正确的代码
 swift 3中sort()的API改成了sorted(by: ) 这点和python比较像
 在这里引用一下慕课网用户"慕大神仙"的解释:
 如果大家使用的是swift3.0版本，那么需要注意：
 而在3.0版本中以上方法被修改为 sorted() sort()
 新版中 sorted()是不会改变原数组的值，而sort()是会改变原数组的值，这点与2.0是不一样的
 */


//使用情景：当闭包表达式作为最后一个参数传递给函数时，可以单独提出来
//问题1：尾随指的是跟在别人后面 闭包到底跟在谁后面？-函数后面
//问题2：用尾随闭包的好处？提升代码的可读性





arr.sorted(by: { a , b in return a > b})


// Trailing Closure
arr.sort(){ a , b in
    return a > b
}

arr.sort{ a , b in
    return a > b
}


arr.map{ number -> String in
    
    var number = number
    
    var res = ""
    repeat{
        res = String(number % 2) + res
        number /= 2
    }while number != 0
    return res
}




//好在 Swift5.3 中对尾随闭包进⾏了优化，调⽤多尾随闭包时最后⼀个闭包将会显⽰出参数名：
UIView.animate(withDuration: 0.3) {
        // 各种动画
    } completion: { (finish) in
        // completion - 动画结束
    }


//总结对于多尾随闭包
//1. Swift 在 5.3 版本中，加⼊了显⽰末尾闭包的参数名，默认隐藏了⾸个尾随闭包的参数名。
//2. 在部分多尾随闭包的场景下，不同Swift版本下将会有不同的匹配结果。
//3. 向后匹配将会在 Swift6 中移除，在多个匿名闭包的地⽅要留意使⽤了向后搜索匹配的情况。
//4. 与其总让 Swift 去向前向后采⽤匹配，不如⽼⽼实实按规范把参数名写


