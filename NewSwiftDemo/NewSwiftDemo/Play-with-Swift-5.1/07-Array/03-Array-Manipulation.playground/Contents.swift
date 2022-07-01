//: Playground - noun: a place where people can play

import UIKit

var courses = ["玩儿转Swift","玩儿转Swift2(第一季)","玩儿转Swift2(第二季)"]

// 添加元素
courses.append("玩儿转Swift2(第三季)")
print(courses)

// 数组常量
//使用let定义的数组不可以更改任何内容

courses += ["玩儿转Swift2(第四季)"]
print(courses)

// 两个数组相加
courses = courses + ["玩儿转Swift面向协议编程","玩儿转Swift面向函数编程"]
print(courses)


// swift 2:
//courses.insert("玩儿转Swift设计模式", atIndex: 5)
//courses.insert("玩儿转Swift设计模式", atIndex: 10)
// 在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同
// swift3中的参数名称为at

courses.insert("玩儿转Swift设计模式", at: 5)        //swift 3
print(courses)


// 删除元素
courses.removeLast()
print(courses)

courses.removeFirst()
print(courses)

// swift 2:
//courses.removeAtIndex(4)
//courses.removeAtIndex(10)
// swift 3中API变成了: .remove(at: )

courses.remove(at: 4)        //swift 3
print(courses)


// swift2:
//courses.removeRange(0..<4)
//courses.removeRange(0..<10)
// swift 3中API变成了.removeSubrange(Range)

courses.removeSubrange(0..<1)      //swift 3
 
//print(courses)

//courses.removeAll()
//print(courses)


// 修改元素
courses[0] = "玩儿转Swift3(第一季)"
print(courses)

courses[1...3] = ["玩儿转Swift3(第二季)","玩儿转Swift3(第三季)","玩儿转Swift3(第四季)"]
print(courses)

courses[0...3] = ["玩儿转Swift3"]
print(courses)



