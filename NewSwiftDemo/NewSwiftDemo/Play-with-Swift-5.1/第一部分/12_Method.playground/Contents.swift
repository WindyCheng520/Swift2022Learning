//: Playground - noun: a place where people can play

import UIKit
//创建一个数学类
class Math {
    //提供一个加法的实例函数
    func add(param1:Double,param2:Double) -> Double {
        return param1+param2
    }
    //提供一个求和的平方的方法
    func sqr(param1:Double,param2:Double) -> Double {
        //调用自身的其他实例方法
        return self.add(param1: param1, param2: param2) * self.add(param1: param1, param2: param2)
    }
}
//创建数学类实例
var obj = Math()
obj.sqr(param1: 3, param2: 3)

//实例对象通过点语法调用实例方法
obj.add(param1: 2, param2: 3)

//创建一个点结构体
struct Point {
    var x:Double
    var y: Double
    //将点进行移动 因为修改了属性的值 需要用mutating修饰方法
    mutating func move(x:Double,y:Double) {
        self = Point(x: self.x+x, y: self.y+y)
    }
    //提供一个类属性
    static let name = "Point"
    static func printName(){
        //使用self调用类属性
        print(self.name)
    }
}
//使用类型名直接调用类方法
Point.printName()


//创建点结构体实例
var point = Point(x: 3, y: 3)




//进行移动 此时位置为 x=6，y=6
point.move(x: 3, y: 3)



//创建一个类作为基类
class MyClass {
    class func myFunc(){
        print("MyClass")
    }
}
class SubMyClass: MyClass {
    //对父类类方法进行覆写
    override class func myFunc(){
        print("SubMyClass")
    }
}
SubMyClass.myFunc()


var array = [1,2,3,4,5,6,7]
//通过下标获取数组中第3个元素 注意下标从零开始
array[2]

class MyArray {
    //向数组中嵌套数组 实现二维数组
    var array:Array<Array<Int>>
    init(param:Array<Int>...){
        array = param
    }
    //subscript是Swift语言中用于定义下标功能的方法
    subscript(index1:Int,index2:Int)->Int{
        set{
            //默认外界设置的值会以newValue为名称传入 开发者也可以进行自定义
            array[index1][index2] = newValue
        }
        get{
            var tmp = array[index1]
            return tmp[index2]
        }
    }
}
var myArray = MyArray(param: [1,2,3],[3,4,5],[4,5,6],[6,7,8],[7,8,9])
//通过下标进行访问
//访问结构中第2个数组中的第3个元素 返回5
myArray[1,2]
//设置第5个数组中的第3个元素的值
myArray[4,2] = 0

