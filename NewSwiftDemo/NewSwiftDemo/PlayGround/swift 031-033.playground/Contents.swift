//: Playground - noun: a place where people can play

import UIKit

//集合
//数组:有序可重复,用于存储同一类型的值.最常用
//定义: Array<类型> 或[类型]

let 一箱牛奶商品 : Array<String>

let 一箱豆奶:[String]

let 一箱12盒光明牛奶 = [String](repeating: "优创", count: 12)

let 一到一百 = Array(1...100)

var 京沪高铁 = ["北京南站","天津","济南","郑州","苏州","虹桥"]  //字面量创建数组
//数组个数  count
//检查是否为空    isEmpty
京沪高铁.append("上海南站")
let 沪杭高铁 = ["嘉兴", "桐乡", "临安", "杭州东站"]

京沪高铁 += 沪杭高铁
京沪高铁[9]   //索引

京沪高铁.insert("镇江", at: 4)

京沪高铁.remove(at: 11)



//集合(Set):值无序不重复

let 群友身份证号 : Set<String> = ["123","123", "456", "789"]  //相同元素会合并

var 二群友身份证号 : Set = ["123","123", "456", "789"]       //可以省略值类型

二群友身份证号.insert("12345678X")

二群友身份证号.remove("123")

//是否包含某元素: contains

二群友身份证号.contains("123")

//转换为数组 转换为数组:sort
let 二群友身份证号数组 = 二群友身份证号.sorted()

//交差并补 (比较有用)


//字典:值无序可重复,但每个值有唯一的标记(key)

//定义: Dictionaray<键类型,值类型> 或 [键类型 : 值类型]

let 机场简写对照字典 = ["PVG":"上海浦东国际机场", "DLC":"大连周水子机场"]
//计数: count   空否:isEmpty

//添加或更新: 字典变量[键] = 值 或updataValue(forKey)方法

//循环遍历一个字典 for in,应为键值对有两个元素,用元组变量

for (key, value) in 机场简写对照字典{
   print(key, value)
}

for (key) in 机场简写对照字典.keys{
    print(key)
}

for (value) in 机场简写对照字典.values{
    print(value)
}

//把键值对分离成数组,用[数组类型](字典变量.keys),[数组类型](字典变量.valus)

let 机场代码组 = [String](机场简写对照字典.keys)
let 机场全称组 = [String](机场简写对照字典.values)
















