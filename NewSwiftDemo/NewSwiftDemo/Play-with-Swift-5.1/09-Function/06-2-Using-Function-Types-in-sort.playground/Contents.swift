//: Playground - noun: a place where people can play

import UIKit


//swift 4.2 随机数API
let ranInt = Int.random(in: 0..<5)
let ranFloat = Float.random(in: 0..<5)
let ranDouble = Double.random(in: 0..<5)
let ranCGFloat = CGFloat.random(in: 0..<5)
let ranBOOL = Bool.random()



var albums = ["Red", "1989", "Reputation"]

// 没有返回值
albums.shuffle()

// 有返回值, 重新返回一个数组
let shuffled = albums.shuffled()

if let random = albums.randomElement() {
    print("The random album is \(random).")
}



// 生成随机数组
var arr:[Int] = []
for _ in 0..<100{
    //swift 2: arr.append(random()%1000)
    //swift3中使用arc4random或者arc4random_uniform方法
//    arr.append(Int(arc4random()%1000))   //swift 3
    
    arr.append(Int.random(in: 0..<1000))   //swift 4.2
    
//    let ranInt = Int.random(in: 0..<5)
}

arr


// 默认排序

arr.sort()
arr

//arr.sortInPlace()
//arr


// 在排序中使用函数参数

func biggerNumberFirst( a: Int , _ b: Int) -> Bool{
//    if a > b{
//        return true
//    }
//    return false
    
    return a > b
}


// swift 3中sort()的API改成了sorted(by: )  这点和python比较像
// 在这里引用一下慕课网用户"慕大神仙"的解释:
// 如果大家使用的是swift3.0版本，那么需要注意：
// 而在3.0版本中以上方法被修改为 sorted()  sort()
// 新版中 sorted()是不会改变原数组的值，而sort()是会改变原数组的值，这点与2.0是不一样的

arr.sorted(by: biggerNumberFirst)    //swift 3


func cmpByNumberString( a: Int , _ b: Int ) -> Bool{
    
    return String(a) < String(b)
}

arr.sorted(by: cmpByNumberString)   //swift 3


func near500(a:Int , _ b:Int)->Bool{
    
    return abs(a - 500) < abs(b - 500) ? true : false
}

arr.sorted(by: near500)   //swift 3


arr
