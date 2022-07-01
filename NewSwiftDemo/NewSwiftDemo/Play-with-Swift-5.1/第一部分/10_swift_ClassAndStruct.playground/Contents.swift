import UIKit
//struct Car {
//    //设置两个属性
//    //价格
//    var price:Int
//    //品牌
//    var brand:String
//    //油量
//    var petrol:Int
//    //提供一个行路的方法
//    mutating func drive(){
//        if petrol>0 {
//            petrol -= 1
//            print("drive 10 milo")
//        }
//    }
//    //提供一个加油的方法
//    mutating func addPetrol(){
//        petrol += 10
//        print("加了10单位油")
//    }
//}
//
////创建一个汽车结构体 价格为100000 品牌为奔驰 初始油量10
//var car = Car(price: 100000, brand: "奔驰", petrol: 10)
////使用点语法获取car实例的属性
//print("这辆\(car.brand)汽车价格\(car.price)，油量\(car.petrol)")
////创建另一个变量进行值的传递
//var car2 = car
////修改car2的价格
//car2.price = 50000
////将打印
///*
// carPrice:100000
// car2Price50000
// */
//print("carPrice:\(car.price)\ncar2Price\(car2.price)")
//
//
////模拟汽车行路行为
//for _ in 0...100 {
//    //如果油量为0 进行加油行为
//    if car.petrol==0 {
//        car.addPetrol()
//        //进行行路行为
//    }else{
//        car.drive()
//    }
//}
//
class ClassCar {
    //设置两个属性
    //价格
    var price:Int
    //品牌
    var brand:String
    //油量
    var petrol:Int
    //提供一个行路的方法
    func drive(){
        if petrol>0 {
            petrol -= 1
            print("drive 10 milo")
        }
    }
    //提供一个加油的方法
    func addPetrol(){
        petrol += 10
        print("加了10单位油")
    }
    //提供一个构造方法
    init(price:Int,brand:String,petrol:Int){
        self.price = price
        self.brand = brand
        self.petrol = petrol
    }
}

//创建ClassCar实例
var classCar = ClassCar(price: 100000, brand: "宝马", petrol: 15)
//进行实例传递
var classCar2 = classCar
//修改classCar2
classCar2.price = 200000
//将打印
/*
 classCarPrice:200000
 classCar2Price200000
 */
print("classCarPrice:\(classCar.price)\nclassCar2Price\(classCar2.price)")
//访问属性
print("这辆\(classCar.brand)汽车价格\(classCar.price)，油量\(classCar.petrol)")
//调用方法
for _ in 0...100 {
    //如果油量为0 进行加油行为
    if classCar.petrol==0 {
        classCar.addPetrol()
        //进行行路行为
    }else{
        classCar.drive()
    }
}


//设计一个交通工具基类
class Transportation {
    //油量 默认提供10
    var petrol:Int = 10
    //提供一个行驶的方法
    func drive()  {
        //具体由子类实现
        if petrol==0 {
            self.addPetrol()
        }
    }
    //提供一个加油的方法
    func addPetrol() {
        petrol+=10
    }
}
//创建继承自Transportation类的汽车类
class Car: Transportation {
    //不同的汽车有不同的轮胎数 为汽车提供一个轮胎数的属性
    var tyre:Int
    //对父类的方法进行重写
    override func drive() {
        super.drive()
        print("在路上行驶了10km")
        self.petrol -= 1
    }
    init(tyreCount:Int) {
        tyre = tyreCount
    }
}
//创建继承自Transportation类的轮船类
class Boat:Transportation {
    //不同大小的轮船有不同的层数 为轮船提供一个层数的属性
    var floor:Int
    //对父类的方法进行重写
    override func drive() {
        super.drive()
        print("在海上行驶了50km")
        self.petrol -= 2
    }
    init(floorCount:Int) {
        floor = floorCount
    }
}
//创建继承自Transportation类的飞机类
class Airplane:Transportation {
    //不同飞机有不同的行驶高度 为飞机提供一个行驶高度的属性
    var height:Int
    //对父类的方法进行重写
    override func drive() {
        super.drive()
        print("在天上行驶了100km")
        self.petrol -= 5
    }
    init(height:Int) {
        self.height = height
    }
}
//创建汽车对象
var car = Car(tyreCount: 4)
//创建轮船对象
var boat = Boat(floorCount: 3)
//创建飞机对象
var plane = Airplane(height: 3000)
//调用drive()使用方法 
car.drive()
boat.drive()
plane.drive()

class TextClass {
    
}
var text1 = TextClass()
var text2 = text1
//将返回true
text1 === text2

/*
 1.设计一个学生类，为每个学生设计姓名，年龄，性别属性，为其提供两个一个学习的方法。
 */
//创建一个性别枚举
enum Sex{
    case 男
    case 女
}
class Student {
    //性别
    let sex:Sex
    //姓名
    let name:String
    //年龄
    let age:Int
    init(sex:Sex,name:String,age:Int){
        self.sex=sex
        self.name=name
        self.age=age
    }
    func study()  {
        print("读书······")
    }
}
//创建学生实力
let stu1 = Student(sex: .男, name: "珲少", age: 25)
//进行学习行为
stu1.study()

/*
 2.结合第1题中的学生类，设计一个班级类，班级类中需要有班级名，学生人数和班长3个属性，并设计转入学生与转出学生的方法。
 */
class Class {
    //班级名
    var name:String
    //学生人数
    var studentCount:Int
    //班长 需要为学生类
    var monitor:Student
    init(name:String,monitor:Student,studentCount:Int){
        self.name=name
        self.monitor=monitor
        self.studentCount=studentCount
    }
    func addStudent() {
        studentCount+=1
    }
    func deleteStudent() {
        if studentCount>0 {
            studentCount-=1
        }
    }
}
//创建一个学生作为班长
let monitor = Student(sex: .女, name: "莉莉", age: 24)
//创建一个班级实例
var class1 = Class(name: "三年一班", monitor: monitor, studentCount: 30)
//转入一个学生
class1.addStudent()

/*
 3.结合第1题中设计的学生类，设计一个老师类，为老师类提供一个教学科目，姓名和所教学生列表的属性，并为老师类提供一个教学方法，在教学方法中进行学生的学习行为。
 */
//设计科目枚举
enum Subject{
    case 数学
    case 外语
    case 语文
}
//设计老师类
class Teacher {
    let name:String
    let subject:Subject
    var studentArray:Array<Student>
    func teach()  {
        for item in studentArray {
            item.study()
        }
    }
    init(name:String,subject:Subject,students:Array<Student>){
        self.name = name
        self.subject = subject
        self.studentArray = students
    }
}
//创建3个学生
let student1 = Student(sex: .男, name: "Jack", age: 24)
let student2 = Student(sex: .男, name: "Nake", age: 23)
let student3 = Student(sex: .女, name: "Lucy", age: 23)
let studentArray = Array(arrayLiteral: student1,student2,student3)
//创建老师实例
let teacher = Teacher(name: "Jaki", subject: .数学, students: studentArray)
//进行教学活动
teacher.teach()
