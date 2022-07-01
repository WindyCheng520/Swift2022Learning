import UIKit

//编写一个函数，功能为传入一个数字判断其是否大于10，将结果返回
func isMoreThanTen(count:Int)->Bool {
    if count>10 {
        return true
    }else{
        return false
    }
}
//进行函数的调用 将返回false
isMoreThanTen(count: 9)
//将返回true
isMoreThanTen(count: 11)

//编写无参的函数
func myFunc1()->String{
    return "无参函数"
}
//将返回字符串"无参函数"
myFunc1()

//编写无参无返回值的函数
func myFunc2() -> Void {
    print("无参无返回值")
}
func myFunc3() {
    print("省略返回值")
}
myFunc2()
myFunc3()

//模拟数据查询函数
func searchData(dataID:String)->(succsee:Bool,data:String){
    //模拟一个查询结果和数据实体
    let result = true
    let data = "数据实体"
    return (result,data)
}
if searchData(dataID: "1101").succsee {
    //查询成功
    print(searchData(dataID: "1101").data)
}


//返回Optional类型值的函数
func myFunc4(param:Int)->Int?{
    guard param>100 else{
        return nil
    }
    return param-100
}
//swift3.0
if let tmp = myFunc4(param: 101) {
    print(tmp)
}
//多参数函数 默认内部命名与外部命名相同
func myFunc5(param1: Int,param2: Int,param3: Int) {
    //这里使用的param1，param2，param3是参数的内部命名
    param1+param2+param3
}
//调用函数的参数列表中使用的param2和param3为外部命名
myFunc5(param1: 1, param2: 2, param3: 3)

//为函数的参数添加外部命名
func myFunc6(out1 param1: Int,ou2 param2: Int,ou3 param3: Int) {
    //这里使用的param1，param2，param3是参数的内部命名
    param1+param2+param3
}
//调用函数时，参数将被外部命名标识 这里的out1，out2，out3为函数参数的外部命名
myFunc6(out1: 1, ou2: 2, ou3: 3)

//省略外部名称的函数参数列表
func myFunc7(param1:Int,_ param2:Int , _ param3:Int){
    param1+param2+param3
}
//在调用函数时 不在标识参数名称
myFunc7(param1: 1, 2, 3)

//默认参数param2的值为10，param3的值为5
func myFunc8(param1:Int,param2:Int = 10 ,param3:Int = 5)  {
    param1+param2+param3
}
//对每个参数都进行传值
myFunc8(param1: 1, param2: 1, param3: 1)
//只对没有设置默认值的参数传值
myFunc8(param1: 10)
func myFunc9(param1:Int,param2:Int=10 ,param3:Int)  {
    param1+param2+param3
}
//对应的参数位置要一致
myFunc9(param1: 10,param3:10)

//编写参数数量不定的函数
func myFunc10(param:Int...){
    var sum=0;
    for count in param {
        sum+=count
    }
    print(sum)
}
//传递参数的个数可以任意
//swift3.0
myFunc10(param: 1,2,3,4,5)
myFunc10(param: 12,2,3)

func myFunc11(param1:Int...,param2:String)  {
    var sum=0;
    for count in param1 {
        sum+=count
    }
    print("\(param2):\(sum)")
}
//swift3.0
myFunc11(param1: 1,2,3, param2: "hello")

//在函数内部修改参数变量的值
//swift2.2
//func myFunc12(inout param:Int){
//    param+=1
//}
//swift3.0
func myFunc12( param:inout Int){
    param+=1
}

var para = 10;
//swift3.0
myFunc12(param: &para)
print(para)

//声明一个函数变量
var addFunc:(Int,Int)->Int
func myFunc15() -> (Int,Int)->Int {
    return {(param1:Int,param2:Int)in
        return param1+param2
    }
}
func myFunc16() -> (Int,Int)->Int {
    func subFunc(param1:Int,param2:Int)->Int{
        return param1+param2
    }
    return subFunc
}

//使用addFunc变量获取返回值
addFunc = myFunc15()
//进行调用
addFunc(1,2)
func myFunc13(param1:Int,param2:Int) -> Int {
    return param2+param1
}
addFunc = myFunc13
addFunc(1,2)
//对函数变量进行赋值
addFunc = {
            (param1:Int,param2:Int) in
                return param1+param2
                                    }
//调用函数变量
addFunc(2,3)
//参数param的类型为函数类型(Int,Int)->Int
func myFunc14(param:(Int,Int)->Int) {
    print(param(1,2))
}
//将addFunc函数作为参数传递进myFunc14函数
//swift3.0
myFunc14(param: addFunc)

//章节练习
/*
 1.编写一个计算阶乘的函数。
 */
func funcOne(param:Int) -> Int {
    guard param>0 else{
        return 0
    }
    var tmp = param
    var result = 1
    while tmp>0 {
        result *= tmp
        tmp -= 1
    }
    return result
}
//swift3.0
funcOne(param: 5)
/*
 2.编写函数，函数功能是：判断输入的字符是否为数字字符。如果是，则输出true，否则输出false。
 */
func funcTwo(param:Character) -> Bool {
    if param <= "9" && param >= "0" {
        return true
    }else{
        return false
    }
}
//swift3.0
funcTwo(param: "9")
/*
 3.编写函数，函数功能是：将两个两位数的正整数a、b合并成一个整数c，合并规则是将a的十位和个位分别放在c的千位和个位，将b的十位和个位分别放在c的百位和十位。
 */
func funcThree(param1:Int,param2:Int) -> Int {
    //param1的个位数字
    let tmpa1 = param1%10
    //param1的十位数字
    let tmpa2 = param1/10%10
    //param2的个位数字
    let tmpb1 = param2%10
    //param2的十位数字
    let tmpb2 = param2/10%10
    return tmpa2*1000+tmpb2*100+tmpb1*10+tmpa1
}
//swift3.0
funcThree(param1: 45, param2: 12)
/*
 4.编写函数，将字符串中的大写字母变成对应的小写字母，小写字母变成对应的大写字母，其它字符不变。
 */
func funcFour(param:String) -> String {
    var str = ""
    for char in param {
        if char >= "a" && char <= "z" {
            //swift3.0
            str.append(String(char).uppercased())
        }else if char >= "A" && char <= "Z" {
             str.append(String(char).lowercased())
        }else{
            str.append(char)
        }
    }
    return str
}
//swift3.0
funcFour(param: "How Are You?")
/*
 5.编写函数，输入一个大于0的数字，将不大于这个数字的所有奇数的和与偶数的和返回。
 */
func funcFive(param:Int) -> (Int,Int) {
    guard param>0 else {
        return (0,0)
    }
    //奇数和
    var sum1 = 0
    //偶数和
    var sum2 = 0
    var tmp = param
    while tmp>0 {
        if tmp%2==0 {
            sum2+=tmp
        }else{
            sum1+=tmp
        }
        tmp-=1
    }
    return (sum1,sum2)
}
//swift3.0
funcFive(param: 10)

/*
 6.编写函数，输入不定个数的一组整数值，统计其中整数和负数的个数，0不纳入统计。
 */
func funcSix(param:Int...) -> (Int,Int) {
    //正数个数
    var sum1 = 0
    //负数个数
    var sum2 = 0
    for index in param {
        if index>0 {
            sum1 += 1
        }else if index<0 {
            sum2 += 1
        }
    }
    return (sum1,sum2)
}
//swift3.0
funcSix(param: 1,2,-1,-4,2,3,5,2,-12)

/*
 7.编写函数，输入圆的半径，返回圆的周长和面积。
 */
func funcSeven(param:Double) -> (Double,Double) {
    //周长
    let l = Double.pi * 2 * param
    //面积
    let  s = Double.pi * param * param
    return (l,s)
    
}
//swift3.0
funcSeven(param: 3)

/*
 8.编写函数，输入不定个数的整数，将其中的最大值和最小值返回。
 */
func funcEight(param:Int...) -> (Int,Int) {
    //swift3.0
    return (param.max()!,param.min()!)
}
//swift3.0
funcEight(param: 1,2,-5,5,13,64,-8)
