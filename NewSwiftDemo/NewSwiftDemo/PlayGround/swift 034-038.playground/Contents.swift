//: Playground - noun: a place where people can play

import UIKit

//控制流
//条件判断 if
//for-in循环 执行固定次数的操作,或操作一个序列(如数组)中的每一项

//1⃣️序列中的每一项都参与for 与 in之间加一个代替每项的名

let 学员组 = ["xiaobo", "希达", "喵星人", "哈哈哈"]

for 学员 in 学员组{
    print(学员)
}

var result = 0
for number in 1...100{
    result += number;
}

print(result)

//2⃣️只需循环固定次数,可以省略项名.比如打印5次相同的文本
for _ in 1...10{
    print("你很吊")
}

//while循环执行一系列操作,直到条件不成立.使用场合:执行次数未知
//格式:while条件{语句}

var i = 1
var j = 0

while j <= 5050{
    i += 1
    j += 1
}

//控制转移语句
//更改代码执行的顺序,从一处代码跳转到另一处.continue break
//continue break


//continue 结束本次循环,break结束整循环
for i in 1...5{
    
    if i == 3{
//        continue;   //结束本次循环
        break;     //结束整个循环
    }
    print(i);
}


//早退语句:在必需条件不满足的早期阶段退出执行.语句关键字 guard, 与if相类似.
//属于条件强调意味很浓的语句.guard let 与if let 相似,用于可选类型.guard 
//有助于提升代码可读性
var hasKey = false;   //false
var credit : Int? = 7  // =5

func 打的(){
    guard hasKey else{
        return;
    }
    
    guard let mycredit = credit , mycredit >= 6 else{
        return
    }
    print("欢迎乘坐本公司出租车!")
}
打的()

//if 和 switch  
//if语句: 条件成立或不成立的条件

//switch语句:超过2个以上情况判断的场合

var 天气 = "晴"

switch 天气 {
case "晴":
    print("晴")
case "阴":
    print("晴")
case "雨":
    print("雨")
case "雪":
    print("雪")
default:
    print("未知天气")
    break
}

//switch 范围匹配
var 温度 = 20
switch 温度 {
case 0...15:
    print("冷")
case 15...25:
    print("舒适")
case 25...40:
    print("热")
default:
    print("未知")
    break
}

//switch 元组匹配(多值)

let 坐标 = (1, 0)

switch 坐标 {
case (0, 0):
    print("原点")
case (let x, 0):
    print("x轴上---x=\(x)")
case (0, _):
    print("y轴上")
case (let x, let y):
    print(x, y)
//case (-2...2, -2...2):
 //   print("在 2*2 的范围内")
//default:
 //   break
}

let 坐标0 = (1, 0)

switch 坐标0 {
case (0, 0):
    print("原点")
case (let x, 0):
    print("x轴上---x=\(x)")
case (0, _):
    print("y轴上")
    case (-2...2, -2...2):
       print("在 2*2 的范围内")
    default:
       break
}

let 坐标1 = (10, 10)

switch 坐标1 {
case (let x, let y) where x == y:
    print("45度对角线上")
case (let x, let y) where x == -y:
    print("135度对角线上")
default:
    print("不再任何对角线上")
}












