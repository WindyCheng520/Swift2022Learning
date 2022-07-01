import UIKit
//十进制数8
var a:UInt8 = 0b1000
//运算后 a的值变为十进制数247 a存储的二进制数为11110111
a = ~a
//使用二进制数11110000与a进行按位与运算，结果为11110000 即十进制数240
a = 0b11110000&a
//使用二进制数11111111与a进行按位或运算，结果为11111111 即十进制数255
a = 0b11111111|a
//使用二进制数11110000与a进行按位异或运算 结果为00001111 即十进制数15
a = 0b11110000^a
//将a按位左移1位，结果为00011110 即十进制数30
a = a<<1
//将a按位右移1位，结果为00001111 即十进制数15
a = a>>1
a<<6

var b:UInt8 = 255
//进行支持溢出的加操作 b的值将变为0
b = b &+ 1
//进行支持溢出的减操作 b的值将在变为255
b = b &- 1
//进行支持溢出的称操作  b的值将变为254
b = b &* 2

//=====================函数重载=====================//
func addFuncInt(param1:Int,param2:Int)->Int{
    return param1+param2
}

addFuncInt(param1: 3, param2: 4)
func addFuncDouble(param1:Double,param2:Double)->Double{
    return param1+param2
}
addFuncDouble(param1: 0.5, param2: 0.3)
//创建整型的加法函数
func addFunc(param1:Int,param2:Int) -> Int {
    return param1+param2
}
//重载addFunc实现浮点型数据的加法
func addFunc(param1:Double,param2:Double) -> Double {
    return param1+param2
}
//再次重载addFunc，实现字符串类型的加法
func addFunc(param1:String,param2:String)->String{
    return param1+param2
}
//=================================================//
class Circle{
    //圆心
    var center:(Double,Double)
    //半径
    var radius:Double
    init(center:(Double,Double),radius:Double){
        self.center = center
        self.radius = radius
    }
}
func +(param1:Circle,param2:Circle) -> Circle {
    return Circle(center: param1.center, radius: param1.radius+param2.radius)
}

func myFunc(closure:(Circle,Circle)->Circle) {
    
}
myFunc(closure: +)
////自定义前缀运算符++
//prefix operator ++
////进行自定义运算符实现
//prefix func ++(param:Int)->Int{
//    return param+1
//}
////将返回6
//++5
////自定义中缀运算符
//infix operator ++
//func ++(param1:Int,parma2:Int)->Int{
//    return param1*param1+parma2*parma2
//}
////将返回41
//5++4
////自定义后缀运算符
//postfix operator ++
//postfix func ++(param1:Int) -> Int {
//    return param1+param1
//}
////将返回10
//5++

//优先级与结合性 
/*
 运算结果23 
 过程如下：
 2*10 = 20
 20*3 = 60
 60/4 = 15
 8+15 = 23
 */
8+2*10*3/4

precedencegroup customGroup {
    higherThan:AdditionPrecedence       // 优先级比加法运算符的优先级高
    lowerThan:MultiplicationPrecedence  // 优先级比乘法运算符的优先级低
    assignment:true         // 设置执行可选链操作时的优先级
    associativity:none      // 定义结合性
}
// 定义中缀运算符，其属性由customGroup描述
infix operator +++:customGroup

// 定义中缀运算符，其优先级属性由与系统的加法相关运算符一致
infix operator ++++:AdditionPrecedence

//1.模拟C语言通过自定义运算符的方式实现前缀自增、前缀自减、后缀自增、后缀自减运算符。
//定义前缀自增运算符
prefix operator ++
//定义后缀自增运算符
postfix operator ++
//定义前缀自减运算符
prefix operator --
//定义后缀自减运算符
postfix operator --
//进行实现
prefix func ++( param:inout Int)->Int{
    param+=1
    return param
}
postfix func ++( param:inout Int)->Int{
    param+=1
    return param-1
}
prefix func --( param:inout Int)->Int{
    param-=1
    return param
}
postfix func --( param:inout Int)->Int{
    param-=1
    return param+1
}

//2.Swift语言中的加法运算符不能支持对区间范围的相加操作，重载加法运算符，使其支持区间的追加，例如(0…5)+5计算后的结果为区间0…10。
func +(param:ClosedRange<Int>,param2:Int)->ClosedRange<Int>{
    return param.lowerBound...param.upperBound+param2
    
}

var newRange = 0...5+5

//3.自定义新后缀运算符“!*”，其功能是对某个数进行阶乘计算。
postfix operator *!
postfix func *! (param:Int)->Int{
    var result = 1
    var tmp = param
    while tmp>0 {
        result *= tmp
        tmp-=1
    }
    return result
}
//得到计算结果120
5*!




