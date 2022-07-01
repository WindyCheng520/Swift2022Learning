import UIKit

class Student {
    //定义姓名和年龄为变量存储属性 可以修改
    var name:String
    var age:Int
    //定义性别为常量存储属性 一旦学生实例被构造出来则不能再进行修改
    let sex:String
    //定义一个所在学校的存储属性 默认为安阳一中
    var schoolName = "安阳一中"
    //提供一个构造方法
    init(name:String,age:Int,sex:String)  {
        self.name = name
        self.age = age
        self.sex = sex
    }
}
struct Point {
    var x:Double
    var y:Double
}
class PointC {
    var x:Double
    var y:Double
    init(x:Double,y:Double){
        self.x = x
        self.y = y
    }
}
let point = Point(x: 2, y: 1)
//下面的代码将引起编译器报出错误
//point.x = 3
let point2 = PointC(x: 2, y: 2)
//类实例修改则没有问题
point2.y = 5
class Work {
    var name:String
    init(name:String){
        self.name = name
        print("完成了Work类实例的构造")
    }
}
class People {
    var age:Int
    lazy var work:Work = Work(name: "teacher")
    init(age:Int){
        self.age = age
    }
}
//构造People类实例时 并没有打印Word类的构造信息
var people = People(age: 24)
//使用work属性时，才进了Work实例的构造
print(people.work)

class Circle {
    //提供两个存储属性
    var r:Double
    var center:(Double,Double)
    //提供周长与面积为计算属性
    var l:Double{
        get{
            return 2*r*Double.pi
        }
        set{
            r = newValue/2/Double.pi
        }
    }
    var s:Double{
        get{
            return r*r*Double.pi
        }
        //自定义传值名称
        set(myValue){
            r = sqrt(myValue/Double.pi)
        }

    }
    //提供一个构造方法
    init(r:Double,center:(Double,Double)){
        self.r = r
        self.center = center
    }
}
//创建圆类实例
var circle = Circle(r: 3, center: (3,3))
//通过计算属性获取周长与面积
print("周长是：\(circle.l);面积是：\(circle.s)")
//通过周长和面积来设置圆的半径
circle.l = 12*Double.pi
print(circle.r)
circle.s = 25*Double.pi
print(circle.r)

class TestClass {
    var test:Int{
        return 10
    }
}
var test = TestClass()
//对只读的计算属性进行设置会报出错误
//test.test = 10

class Teacher {
    var name:String{
        //此属性将要被赋值时会调用的方法
        willSet(new){
            //其中会默认生成一个newValue来接收外界传递进来的新值
            print("将要设置名字为:\(new)")
        }
        //此属性已经被赋值后会调用的方法
        didSet(old){
            //其中会默认生成一个oldValue来保存此属性的原始值
            print("旧的名字为:\(old)")
        }
    }
    var age:Int
    init(name:String,age:Int){
        self.age=age
        self.name=name
    }
}
//构造时并不会打印属性监听器中的打印信息
var teacher = Teacher(name: "珲少", age: 24)
//会打印属性监听器中的打印信息 如下：
/*
 将要设置名字为:Jaki
 旧的名字为:珲少
 */
teacher.name = "Jaki"

@propertyWrapper
struct MoreThanZero {
    private var number: Int
    init() { self.number = 0 }
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue < 0 {
                self.number = 0
            } else {
                self.number = newValue
            }
        }
    }
}

@propertyWrapper
struct NotEmptyString {
    private var value: String
    init() { self.value = "defaule" }
    var wrappedValue: String {
        get { return value }
        set {
            if newValue.count > 0 {
                self.value = newValue
            } else {
                self.value = "default"
            }
        }
    }
}

class Member:CustomStringConvertible {
    private var name:String
    private var age:Int
    init() {
        self.name = "default"
        self.age = 0
    }
    @NotEmptyString var memberName:String
    @MoreThanZero var memberAge:Int
    var description: String {
        return "\(self.memberName):\(self.memberAge)"
    }
}

let member1 = Member()
member1.memberAge = -1
member1.memberName = ""
print(member1)


class SomeClass {
    //静态存储属性
    static var className = "SomeClass"
    //静态计算属性
    static var subName:String{
        return "sub"+className
    }
    class var classSubName:String{
        return "class" + subName
    }
}
//类属性不需要创建示例对象，直接使用类名来调用
SomeClass.className
SomeClass.subName
SomeClass.classSubName
//创建一个继承于SomeClass的子类
class SubClass:SomeClass{
    //对计算类属性的计算方法进行覆写
    override class var classSubName:String{
        return "newNme"
    }
}
SubClass.classSubName

//章节练习
/*
 1.设计一个直线结构体，为其提供中心点，长度，斜率3个计算属性。
 */
struct Line {
    //直线的两点
    var point1:(Double,Double)
    var point2:(Double,Double)
    var center:(Double,Double){
        return ((point1.0+point2.0)/2,(point1.1+point2.1)/2)
    }
    //sqrt为开平方函数 abs为绝对值函数
    var width:Double{
        return  sqrt(abs(point1.0-point2.0)*abs(point1.0-point2.0)+abs(point1.1-point2.1)*abs(point1.1-point2.1))
    }
    var k:Double{
        return abs(point1.1-point2.1)/abs(point1.0-point2.0)
    }
    init(point1:(Double,Double),point2:(Double,Double)){
        self.point1 = point1
        self.point2 = point2
    }
}

var line = Line(point1: (1,1), point2: (3,3))
line.center
line.width
line.k




