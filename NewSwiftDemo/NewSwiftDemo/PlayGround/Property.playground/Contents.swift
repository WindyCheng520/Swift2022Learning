import UIKit

//1、存储属性
//存储属性是一个作为特定类和结构体实例一部分的常量或变 量。存储属性要么是变量存储属性(由 var 关键字引入)要么是常量存储属性(由 let 关键字引入)
//1> 常量结构体实例的存储属性：
//
//如果创建了一个结构体的实例并且把这个实例赋给常量，不能修改这个实例的属性，即使是声明为变量的属性

struct Person {
    var name: String
    var age: Int
}
//必须要声明一个变量类型的结构体实例,否则不能修改实例的属性.即使这个属性声明的是变量
var p = Person(name: "zhangsan", age: 12)
let s = p
p.age = 21
print("age is \(p.age)")


//2> 延迟存储属性
//
//延迟存储属性的初始值在其第一次使用时才进行计算。可以通过在其声明前标注 lazy 修 饰语来表示一个延迟存储属性。
//如果被标记为 lazy 修饰符的属性同时被多个线程访问并且属性还没有被初始化，则无法保 证属性只初始化一次。
//延迟存储属性
class DataImporter {
    var fileName = "data.text"
    init() {
        print("dataImporter init")
    }
}
class DataManager {
    //声明一个延迟存储属性 importer
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")
print("manager.data.appended finish")
print(manager.importer.fileName) //第一次使用时才进行计算
/**
 manager.data.appended finish
 dataImporter init
 data.text
 */


//2、计算属性
//除了存储属性，类、结构体和枚举也能够定义计算属性，而它实际并不存储值。相反，它提供一个读取器和一个可选的设置器来间接得到和设置其它的属性和值。
//1> 只读计算属性：
//一个有读取器但是没有设置器的计算属性就是所谓的只读计算属性。只读计算属性返回一个值，也可以通过点语法访问，但是不能被修改为另一个值
//必须用 var 关键字定义计算属性(包括只读计算属性)为变量属性，因为它们的值不是固定的。 let 关键字只用于常量属性，用于明确那些值一旦作为实例初始化就不能更改
//3、属性观察者
//willSet 会在该值被存储之前被调用
//didSet 会在一个新值被存储后被调用
//如果你实现了一个 willSet 观察者，新的属性值会以常量形式参数传递。你可以在你的 willSet 实现中为这个参数定义名字。如果你没有为它命名，那么它会使用默认的名 newValue
//如果你实现了一个 didSet观察者，一个包含旧属性值的常量形式参数将会被传递。你可以为 它命名，也可以使用默认的形式参数名 oldValue 。如果你在属性自己的 didSet 观察者里给 自己赋值，你赋值的新值就会取代刚刚设置的值

class StepCounter {
    var totalStep: Int = 0 {
        willSet(newTotalSteps) {  //为新的属性值定义名字: newTotalSteps, 如果没有定义,默认就是 newValue
            print("newtotalSteps: \(newTotalSteps)")
        }
        didSet {  //默认的属性名是 oldValue
            if totalStep > oldValue {
                print("Add \(totalStep - oldValue) steps")
            }
        }
    }
}
var stepCounter = StepCounter()
stepCounter.totalStep = 200
stepCounter.totalStep = 360
stepCounter.totalStep = 896
/**
 newtotalSteps: 200
 Add 200 steps
 newtotalSteps: 360
 Add 160 steps
 newtotalSteps: 896
 Add 536 steps
 */
//观察属性的能力同样对全局变量和局部变量有效。全局变量是定义在任何函数、方法、闭包或者类型环境之外的变量。局部变量是定义在函数、方法或者闭包环境之中的变量
//定义一个全局变量
var count: Int = 0 {
    willSet(newCount) {
        print("newCount: \(newCount)")
    }
    didSet {
        print("Add count: \(count - oldValue)")
    }
}
count = 10
if count == 10 {
    print("ten")
}

//4、类型属性
//使用 static 关键字来定义类型属性，用类名来调用类型属性。对于类类型的计算类型属性，你可以使用 class 关键字 来允许子类重写父类的实现
class SomeClass {
    static let count = 10  //定义存储型类型属性
    static var count2: Int {   //定义计算型类型属性
        return 20
    }
    class var count3: Int { //使用 class 关键字允许子类重写父类的实现
        return 30
    }
}
//直接使用类型调用即可
print("\(SomeClass.count)")


//5、实例方法
//实例方法是属于特定类实例、结构体实例或者枚举实例的函数
//每一个类的实例都隐含一个叫做 self 的属性，它完完全全与实例本身相等
//一般不需要在代码中显式地写出 self
//当一个实例方法的形式参数名与实例中某个属性拥有相同的名字的时候，可以使用 self 属性来区分形式参数名和属性名
//1> 在实例方法中修改属性
//
//结构体和枚举是值类型。默认情况下，值类型属性不能被自身的实例方法修改
//在 func 关键字前放一个 mutating 关键字来指定可以修改属性
//通过在 func关键字之前使用 static关键字来明确一个类型方法。类同样可以使用 class关键 字来允许子类重写父类对类型方法的实现
//枚举的异变方法可以设置隐含的 self 属性为相同枚举里的不同成员

struct Point {
    var x = 0
    var y = 0

    //使用 mutating 改变 x 和 y 的值
    mutating func moveBy(x: Int, y: Int){
        self.x += x
        self.y += y
    }

    //使用 mutating 改变 self 的值
    mutating func moveBy2(x: Int, y: Int) {
        self = Point(x: self.x + x, y: self.y + y)
    }

    func printInfo() {
        print("x is \(x), y is \(y)")
    }
    //添加 static 关键字,就是类方法
    static func info() {
        print("类方法")
    }
}
var point = Point(x: 2, y: 3)
//point.moveBy(x: 3, y: 5)
point.moveBy2(x: 3, y: 5)
point.printInfo()
Point.info()

//枚举的异变方法
enum Direction {
    case north, south, east, west
    mutating func next() {
        switch self {
        case .north:
           self = .south
        case .south:
            self = .north
        case .east:
            self = .west
        case .west:
            self = .east
        }
    }
}
var dir = Direction.south
dir.next()


//6、下标
//类、结构体和枚举可以定义下标，它可以作为访问集合、列表或序列成员元素的快捷方式。可使用下标通过索引值来设置或检索值而不需要为设置和检索分别使用实例方法
//可以为一个类型定义多个下标，并且下标会基于传入的索引值的类型选择合适的下标重载使用。下标没有限制单个维度，可以使用多个输入形参来定义下标以满足自定义类型的需求
//下标脚本允许你通过在实例名后面的方括号内写一个或多个值对该类的实例进行查询。它的语法类似于实例方法和计算属性。使用关键字 subscript 来定义下标，并且指定一个或多个 输入形式参数和返回类型，与实例方法一样。与实例方法不同的是，下标可以是读写也可以 是只读的
//在对应类型的实例上调用下标，同样也可以定义类型本身的下标，这类下标叫做类型下标。可通过在 subscript 关键字前加 static 关键字来标记类型下标。在类里则使用 class 关键字，这样可以允许子类重写父类的下标实现

//下表语法
struct TimesTable {
    let multipier: Int
    subscript(index: Int) -> Int {
        return multipier * index
    }
}
let threeTimesTable = TimesTable(multipier: 3)
print("six time three is \(threeTimesTable[6])")  //18










