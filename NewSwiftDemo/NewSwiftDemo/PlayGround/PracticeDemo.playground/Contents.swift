//: Playground - noun: a place where people can play

import UIKit
import AVFoundation


let dic:[String: Any] = ["name": "windy", "age": 21]
debugPrint("map--------遍历字典")
dic.map{debugPrint("\($0): \($1)")}
debugPrint("map--------遍历字典")


let array = [10, 2, 5, 4, 3]

debugPrint("map--------逆序遍历数组")
for temp in (0..<array.count).reversed(){
    debugPrint(array[temp])
}
debugPrint("map--------逆序遍历数组")


debugPrint("map--------遍历数组")
array.map{debugPrint($0)}
debugPrint("map--------遍历数组")



let array1 = array.sorted(by: { $0 < $1})

print(array1)


var intArray: [Int] = [1, 2, 3, 4, 5]
var stringArray: [String] = intArray.map {
    
   //  "\($0)"
    (value: Int) -> String in
    return "\(value)"
}
print(stringArray)

var stringArray1: [String] = intArray.map({ String.init($0) })
debugPrint("打印--------遍历字符串数组")
print(stringArray1)
debugPrint("打印--------遍历字符串数组")

var oddIntArray: [Int] = intArray.compactMap {
    $0 % 2 == 1 ? $0 : nil
    //(value: Int) -> Int? in
   // return value % 2 == 1 ? value : nil
}
//oddIntArray: [1, 3, 5]
oddIntArray

print(oddIntArray)

let datas = [1,2,3,4,5]
for i in datas {
    if i == 2{
        print(i) //2
    }
}

for i in datas where i == 2 {
    print(i) //2
}

//获得斐波那契数列的平方
//常规写法
let fibs = [1,1,2,3,5,8]
var squared:[Int] = []
for fib in fibs {
    squared.append(fib*fib)
}
//map写法
let squared1 = fibs.map{fib in fib*fib}
//可以用map方法来完成的操作，一般就是新建一个数组容器，然后遍历数据源，操作后把结果塞进容器中。诸如此类所有操作都可以用map代替

//map方法的实现
extension Array {
    func map<U>(transform:(Element)->U) -> [U]{
        var result:[U] = []
        result.reserveCapacity(self.count)
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}
//Element是数组元素的占位符

fibs.filter{num in num % 2 == 0}//获得fibs数组中能被2整除的元素

//filter方法发实现
extension Array{
    func filter (f:(Element)->Bool) -> [Element] {
        var result:[Element] = []
        for item in self where f(item) {
            result.append(item)
        }
        return result
    }
}

var sum = 0
for num in fibs {
    sum = sum + num
}

fibs.reduce(0){sum,num in sum+num}
//实现
extension Array {
    func reduce<U>( initial:U,f:(U,Element)->U) ->U {
        var initial = initial
        for item in self {
            initial = f(initial,item)
        }
        return initial
    }
}

//可以理解函数式。不推荐使用，时间复杂度高
//使用reduce模拟map方法
extension Array {
    func map2<U>(transform:(Element)->U) -> [U]{
        return reduce(initial: [],f:{item1,item2 in item1 + [transform(item2)]})
    }
}

//flatMap铺平的map方法
let suits = ["1", "2", "3", "4"]
let ranks = ["J", "Q", "K", "A"]

let allCombinations = suits.flatMap { suit in
    ranks.map{ rank in
        (suit, rank)
    }
}
//模拟filter方法
/*extension Array {
    func filter2(f:Element->Bool) -> [Element] {
        return reduce([],{item1,item2 in f(item2)?item+[item2]:item1})
    }
}
 */

/**
 返回月份的天数
 */
func daysCount(year: Int, month: Int) -> Int {
    
    var daysArray = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if year % 400 == 0 || year % 100 != 0 && year % 4 == 0 {
        daysArray[2] += 1
      }
    return daysArray[month]
}


//1.使用componentsSeparatedByString()方法
let str:NSString = "北京、上海、深圳、香港"
print("原始字符串：\(str)")

let splitedArray = str.components(separatedBy: "、")
print("拆分后的数组：\(splitedArray)")


//2，使用characters.split()方法

let str1 = "北京、上海、深圳、香港"
print("原始字符串1：\(str1)")

let splitedArray1 = str1.split{$0 == "、"}.map(String.init)
print("拆分后的数组：\(splitedArray1)")

//tableView.subviews.makeObjectsPerformSelector(#selector(self.removeFromSuperview))
//  publics


