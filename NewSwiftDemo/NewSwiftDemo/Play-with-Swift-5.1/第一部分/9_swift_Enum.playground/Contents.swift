import UIKit

////创建一个姓氏类型枚举
//enum Surname {
//    //使用case进行枚举值的设置
//    case 张
//    case 王
//    case 李
//    case 赵
//}

//创建一个姓氏枚举类型
enum Surname {
    //在一条case语句中定义多个枚举值
    case 张,王,李,赵
}

//创建一个姓氏枚举类型的变量
var sur:Surname
//对sur变量进行复制
sur=Surname.张
//对sur进行修改
sur = .王
//对枚举类型的变量进行switch选择结构
switch sur {
    case .张:
        print("姓氏张")
    case .王:
        print("姓氏王")
    case .李:
        print("姓氏李")
    case .赵:
        print("姓氏赵")
}

//为枚举类型指定一个原始值类型
enum CharEnum:Character{
    //通过赋值的方式来为枚举值设置一个原始值
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
}

enum IntEnum:Int {
    //第一个枚举值的原始值设置为1
    case 一 = 1
    //默认原始值为2
    case 二
    //默认原始值为3
    case 三
    //默认原始值为4
    case 四
}

//创建枚举变量
var char = CharEnum.a

//获取char枚举变量的原始值 "a"
var rawValue = char.rawValue

//通过原始值构造枚举变量 一
var intEnum = IntEnum(rawValue: 1)

//定义形状枚举
enum Shape {
    //圆形 设置圆心和半径 为相关值
    case circle(center:(Double,Double),radius:Double)
    //矩形 设置中心 宽 高 为相关值
    case rect(center:(Double,Double),width:Double,height:Double)
    //三角形 设置3个顶点 为相关值
    case triangle(point1:(Double,Double),point2:(Double,Double),point3:(Double,Double))
}

//创建圆形枚举实例 此圆的圆心为(0,0)，半径为3
var circle = Shape.circle(center: (0, 0), radius: 3)
//创建矩形枚举实例 此矩形的中心点为(1,1)，宽度10，高度15
var rect = Shape.rect(center: (1, 1), width: 10, height: 15)
//创建三角形枚举实例 此三角形的3个顶点为(2,2),(3,3),(2,5)
var triangle = Shape.triangle(point1: (2, 2), point2: (3, 3), point3: (2, 5))

//写一个匹配函数 参数为Shape枚举类型
func shapeFunc(param:Shape){
    switch param {
        //进行参数捕获
    case let .circle(center,radius):
        print("此圆的圆心为：\(center)，半径为：\(radius)")
    case let .rect(center,width,height):
        print("此矩形的中心为：\(center)，宽为：\(width)，高为：\(height)")
    case let .triangle(point1,point2,point3):
        print("此三角形的3个顶点分别为：\(point1)，\(point2)，\(point3)")
    }
}
shapeFunc(param: circle)
shapeFunc(param: rect)
shapeFunc(param: triangle)

//使用递归算法来实现计算正整数的阶乘
func mathsFunc(param:Int)->Int{
    let tmp = param-1
    if tmp>0 {
        //递归
        return mathsFunc(param: tmp) * param
    }else{
        return 1
    }
}
mathsFunc(param: 5)

//使用枚举来模拟加减乘除四则运算
indirect enum Expression {
    //描述单个数字
    case num(param:Int)
    //表示加法运算 将Expression作为相关值参数类型
    case add(param1:Expression,param2:Expression)
    //表示减法运算
    case sub(param1:Expression,param2:Expression)
    //表示乘法运算 
    case mul(param1:Expression,param2:Expression)
    //表示除法运算
    case div(param1:Expression,param2:Expression)
}
////表示表达式5+5
//var exp1 = Expression.add(param1: 5, param2: 5)
////表示表达式10-5
//var exp2 = Expression.sub(param1: 10, param2: 5)
////表示表达式5*5
//var exp3 = Expression.mul(param1: 5, param2: 5)
////表示表达式10/2
//var exp4 = Expression.div(param1: 10, param2: 2)

//创建单值5
var num5 = Expression.num(param: 5)
//进行表达式5+5描述
var exp1 = Expression.add(param1: num5, param2: num5)
//创建单值2
var num2 = Expression.num(param: 2)
//进行表达式(5+5)*2的描述
var exp2 = Expression.mul(param1: exp1, param2: num2)
//创建单值8
var num8 = Expression.num(param: 8)
//进行表达式(5+5)*2-8的描述
var exp3 = Expression.sub(param1: exp2, param2: num8)
//进行表达式((5+5)*2-8)/2的描述
var expFinal = Expression.div(param1: exp3, param2: num2)

//这个递归函数的作用是将Expression描述的表达式进行运算 结果返回
func expressionFunc(param:Expression) -> Int {
    switch param {
        //单值直接返回
    case let .num(param):
        return param
    case let .add(param1, param2):
        //返回加法运算结果
        return expressionFunc(param: param1)+expressionFunc(param: param2)
    case let .sub(param1, param2):
        //返回减法运算结果
        return expressionFunc(param: param1)-expressionFunc(param: param2)
    case let .mul(param1, param2):
        //返回乘法运算结果
        return expressionFunc(param: param1)*expressionFunc(param: param2)
        //返回除法运算结果
    case let .div(param1, param2):
        return expressionFunc(param: param1)/expressionFunc(param: param2)
    }
}
//进行((5+5)*2-8)/2运算 结果6
expressionFunc(param: expFinal)

//模拟设计一个交通工具枚举 将速度与乘坐价钱作为枚举的相关值
enum Transport {
    case car(price:Int,speed:Float)
    case boat(price:Int,speed:Float)
    case airport(price:Int,speed:Float)
}
//创建一个汽车交通工具 价钱2 速度80
var car = Transport.car(price: 2, speed: 80)


// 定义枚举类型
enum Month : CaseIterable{
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}

print(Month.allCases) //定义的枚举遵循CaseIterable协议后, 编译时Swift 会自动合成一个allCases属性，是包含枚举的所有case项的数组

Month.allCases.count





