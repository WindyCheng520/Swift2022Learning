import UIKit
//8位无符号整型数的最大值 255
var a1 = UInt8.max
//16位无符号整型数的最大值 65535
var a2 = UInt16.max
//32位无符号整型数的最大值 4294967295
var a3 = UInt32.max
//64位无符号整型数的最大值 18446744073709551615
var a4 = UInt64.max

//获取数据类型所占位数 在64位机器上UInt占8字节64位
var a5 = MemoryLayout<UInt>.size

var maxInt8 = Int8.max     //127
var mimInt8 = Int8.min    //-128
var maxInt16 = Int16.max  //32767
var minInt16 = Int16.min  //-32768
var maxInt32 = Int32.max  //2147483647
var minInt32 = Int32.min  //-2147483648
var maxInt64 = Int64.max  //9223372036854775807
var minInt64 = Int64.min  //-9223372036854775808
var intSize = MemoryLayout<Int>.size //8位

var b = MemoryLayout<Float>.size    //4个字节
var b1 = MemoryLayout<Float32>.size //4个字节
var b2 = MemoryLayout<Float64>.size //8个字节
var b3 = MemoryLayout<Float80>.size //16个字节
var c = MemoryLayout<Double>.size  //8个字节

var sum = 1.25e3 //1.25*(10^3) = 1250
var sun2 = 0x1p3 //1*(2^3) = 8

var num1 = 001.23
var num2 = 1_000
var num3 = 1_000.1_001


var bool1 = true    //创建布尔真变量
var bool2 = false   //创建布尔假变量
//创建钢笔元组类型 其中有两种类型组成 字符串类型的名称 和整数类型的价钱
var pen:(name:String,price:Int) = ("钢笔",2)
//获取pen变量名称
var name = pen.name
//获取pen变量价格
var price = pen.price
//不指定参数名称的元组
var car:(String,Int) = ("奔驰",2000000)
//通过下标来去元组中各个组成元素的值
var carName = car.0
var carPricr = car.1
//进行元组的分解
var (theName,_) = car
//此时 theName变量被赋值为"奔驰" thePrice变量被赋值为2000000
print(theName)

//声明obj为String?类型
var obj:String? = "HS"
if obj != nil {
    obj!
}

var obj0:String
obj0 = "HS"
print(obj0)

//进行if-let绑定
if let tmp = obj {
    print(tmp)
}else{
    obj = "HS"
    print(obj!)
}
//if-let多Optional值绑定
var obj1:Int? = 1
var obj2:Int? = 2
if let tmp1 = obj1,let tmp2 = obj2, tmp1<tmp2 {
    print(tmp1,tmp2)
}

//var obj4:Int?
//obj4 = 3
//print(obj4 + 1)  //会编译异常，因为obj4没有进行拆包

// 声明Obj4为隐式解析的变量
var obj4:Int!
obj4 = 3
// 在使用时，无需再进行拆包操作，Swift会自动帮我们做拆包
print(obj4 + 1)

//为Int类型取一个别名Price
typealias Price = Int
//使用Price代替Int 效果完全一样
var penPrice:Price = 100
//章节练习
/*
 1.分别创建用二进制、八进制、十进制与十六进制表示的变量25。
 */
var count1 = 25         //十进制
var count2 = 0o31       //八进制
var count3 = 0x19       //十六进制
var count4 = 0b00011001 //二进制
/*
 2.小文到文具店买文具，其需要购买铅笔、橡皮和文具盒三种文具，3种文具的标价分别为2元、1元、15元，使用元组来模拟这3种文具组成的套装。
 */
var bundle:(pencil:Int,eraser:Int,pencilCase:Int) = (2,1,15)
/*
 3.编写一个样品检测器，当样品的质量大于30单位的时候，输出合格，输入样品可能为空，使用if-let语句来实现。
 */
var product:Int? = 100
if let weight = product, weight > 30  {
    print("产品合格")
}


