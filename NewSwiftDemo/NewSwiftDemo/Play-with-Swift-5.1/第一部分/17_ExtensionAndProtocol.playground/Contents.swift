import UIKit

//创建一个类 有两个属性
class MyClass {
    var name:String
    var age:Int
    init(){
        name = "HS"
        age = 24
    }
}
extension MyClass{
    //扩展一个实例方法
    func logName() -> String {
        print(name)
        return name
    }
    //扩展一个类方法
    class func logClassName(){
        print("MyClass")
    }
}

var obj3 = MyClass()
//调用扩展中的方法
obj3.logName()
MyClass.logClassName()
//var obj2 = MyClass(name: "ZYH", age: 24)
//var obj = MyClass()
////调用扩展中添加的属性
//obj.nameAndAge

extension Int{
    //修改本身需要使用nutating
    mutating func change() {
        self = self*self
    }
}
var count = 3
count.change()
//打印9
print(count)



protocol MyProtocol {
    func myFunc();
}
//使用扩展使类型遵守某个协议
extension MyClass:MyProtocol{
    //必须对协议中的方法进行实现
    func myFunc() {
        print("myFunc")
    }
}
var cls = MyClass()
cls.myFunc()


protocol PortocolNew {
    //定义实例属性
    //可读的
    var name:String{get}
    //可读可写的
    var age:Int{set get}
    //可读的
    var nameAndAge:String{get}
    //定义类属性
    static var className:String{get}
}
//创建一个类来遵守Protocol协议
class ClassNew: PortocolNew {
    //进行协议中属性的实现
    var name: String
    var age: Int
    var nameAndAge: String{
        get{
            return "\(name)"+"\(age)"
        }
    }
    static var className: String{
        get{
            return "MyClass"
        }
    }
    init(){
        name = "HS"
        age = 24
    }
}

//定义一个协议
protocol PortocolNewTwo {
    //声明示例方法
    func logName()
    //声明静态方法
    static func logClassName()
}
protocol SubProcotol:class,PortocolNewTwo {
    //此协议中自动继承PortocolNewTwo协议中约定的方法
}
@objc protocol ClassProcotol:class {
    //此协议方法可选实现 即遵守协议的类可以实现也可以不实现
    @objc optional func log()
}
//为ClassProtocol中的方法提供默认实现
extension ClassProcotol{
    func log(){
        print("log")
    }
}
//遵守ClassProtocol协议
class ClassE: ClassProcotol {
    
}
var clsE = ClassE()
//直接可以调用协议中的方法 有默认的实现
clsE.log()
//遵守协议 进行实现
class ClassNewTwo: PortocolNewTwo {
    var name: String
    var age: Int
    init(){
        name = "HS"
        age = 24
    }
    func logName() {
        print(name)
    }
    static func logClassName() {
        print("ClassNewTwo")
    }
}

var array:Array<MyProtocol>
