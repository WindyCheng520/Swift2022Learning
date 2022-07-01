//: Playground - noun: a place where people can play

import UIKit

//可选类型：代表可能有值的情况。紧接原类型后面加问号
var address : String?
address

//nil:可选变量中代表"值缺失"的情况
//把一个可选变量"重置"
var sex : Bool? = false
sex = nil


//可选判断：使用if语句来判断可选变量是否有值（与nil比较）

var gender : Bool? = true
if gender == nil{
    print("没有选择性别")
}else{
    print("用户选择了性别")
}

//可选拆包：把可选变量中的值解压出来，在变量后加!
if gender! == true {
    print("男性")
}else{
    print("女性")
}


//可选绑定：将判断和拆包，"安全"组合在一起
//指如果可选变量有值，则将值保存于一个临时变量，可用if let 语句进行检查
//格式：if let 临时常量 = 可选变量{ 语句 }

var sex1 : Bool? = false
if let sex2 = sex1 {
    print(sex2)
}else{
    print("用户没有选择性别")
}

//多重绑定：一次可以对多个可选变量进行绑定，只需在绑定语句上用逗号分隔

//var addr : String? = "上海市"
var addr : String?

if let sex1 = sex1, let addr = addr{
    print(sex1, addr)
}else{
    print("用户性别和地址不完善")
}

//绑定判断:加上where语句可以对绑定的结果进行判断
if let sex1 = sex1, let addr = addr , !sex1 && addr == "上海市"{
    print(addr, "的美女包邮哦")
}else{
    print("用户性别和地址不完善")
}

//有值可选类型:在变量类型后加感叹号
//一开始就有值,且今后假定一直有值,且没有此变量,程序可能无法顺利运行的情况下使用
var 手机号 : Int!
手机号 = 16888888888

//如果不确定是否有值,则用常规可选类型


//断言:程序继续运行必须满足的条件达不到,中断运行并提示用户以方便调试,
//方法名 assert.一般用于开发过程中检查一些必须条件

var isNetwork : Bool = true
assert(isNetwork, "网络不通")
print("网络不通")


