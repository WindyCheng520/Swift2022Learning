//: Playground - noun: a place where people can play

import UIKit
var str = "HS"
//进行实例的类型检查
if str is String {
    print("str 的类型是String")
}

//创建一个基类
class BaseClass {
    
}
//创建一个子类

//自定义一个类及其子类
class MyClass: BaseClass {
    var name:String?
}
class MySubClassOne: MyClass {
    var count:Int?
}
class MySubClassTwo: MyClass {
    var isBiger:Bool?
}
//创建3个实例
var obj1 = MyClass()
obj1.name = "HS"
var obj2 = MySubClassOne()
obj2.count = 100
var obj3 = MySubClassTwo()
obj3.isBiger=true
//将实例存放在其公共父类类型的数组集合中
var array:[MyClass] = [obj1,obj2,obj3]
//进行遍历
for var i in 0..<array.count {
    var obj = array[i]
    if obj is MySubClassOne {
        //进行类型转换
        print((obj as? MySubClassOne)!.count!)
        continue
    }
    if obj is MySubClassTwo {
        //进行类型转换
        print((obj as! MySubClassTwo).isBiger!)
        continue
    }
    if obj is MyClass {
        //使用父类共有的属性
        print(obj.name!)
    }
}


var cls1 = BaseClass()
var cls2 = MyClass()
//使用父类实例来进行子类类型的检查 会返回false
if cls1 is MyClass{
    print("cls1 的类型是MyClass")
}
//使用子类实例来进行父类类型的检查 会返回true
if cls2 is BaseClass{
    print("cls2 的类型是BaseClass")
}

//创建3个各自独立的类
class MyClassOne {
    
}
class MyClassTwo {
    
}
class MyClassThree {
    
}
//进行类的实例化
var clsOne = MyClassOne()
var clsTwo = MyClassTwo()
var clsThree = MyClassThree()
//创建一个Any元素类型的数组
var anyArray:Array<Any> = [clsOne,clsTwo,clsThree,100,"HS",false,(1,1),{()->() in print("Closures")}]




//使用AnyObject类型的数组来接收
var clsArray:Array<AnyObject> = [clsOne,clsTwo,clsThree]

for obj in clsArray {
    //进行类型的匹配
    if obj is MyClassOne{
        print("MyClassOne")
    }else if obj is MyClassTwo{
        print("MyClassTwo")
    }else if obj is MyClassThree{
        print("MyClassThree")
    }
}


func exchange<T>( param1:inout T, param2:inout T){
    let tmp = param1
    param1 = param2
    param2 = tmp
}
var p1 = "15"
var p2 = "40"
exchange(param1: &p1, param2: &p2)
p1
p2
//定义一个栈结构的结构体 ItemType为定义栈中元素类型的泛型
struct Stack<ItemType> {
    //内部有关元素类型的操作 都使用ItemType
    var items:[ItemType] = []
    mutating func push(param:ItemType)  {
        self.items.append(param)
    }
    mutating func pop()->ItemType{
        return self.items.removeLast()
    }
}
//为Stack栈类型添加一个扩展
extension Stack{
    //为其添加一个方法 这个方法将返回整体数据 直接使用泛型ItemType即可
    func getArray() -> [ItemType] {
        return items
    }
}
//整型栈
var obj7 = Stack<Int>()
//进行入栈和出栈操作
obj7.push(param: 1)
obj7.pop()
//字符串栈
var obj8 = Stack<String>()
//进行入栈和出栈操作
obj8.push(param: "HS")
obj8.pop()

//定义一个协议
protocol MyProtocol {
    //实现协议时才指定类型
    associatedtype ItemType
    //协议中约定一个ItemType类型的计算属性param
    var param:ItemType {get set}
    //协议中约定一个打印方法
    func printParam(param:ItemType)->Void;
}
//定义一个遵守MyProtocol协议的类
class MyClassP:MyProtocol {
    //进行param计算属性的实现
    //由于Swift可以自动识别类型 这是MyProtocol中的ItemType为Int
    var param: Int{
        get{
            return 0
        }
        set{
            
        }
    }
    //对打印方法进行实现 此时方法中的参数类型会被识别为Int
    func printParam(param: Int) {
        print(param);
    }
}

//T和C都要遵守整型协议
class MyClassTC<T,C> where T:BinaryInteger,C:BinaryInteger {
    var param1:T
    var param2:C
    init(param1:T,param2:C){
        self.param1=param1
        self.param2=param2
        
    }
}


var obj9 = MyClassTC(param1: 1, param2: 1)

