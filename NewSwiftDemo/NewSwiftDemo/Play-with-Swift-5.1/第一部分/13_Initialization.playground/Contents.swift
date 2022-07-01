import UIKit

class MyClass {
    //声明属性时直接进行赋值
    var count:Int = 0 {
        willSet{
            print("willSet")
        }
    }
    var name:String{
        didSet{
            print("didSet")
        }
    }
    var opt:Int?
    //自定义构造方法
    init(){
        //必须对name属性进行赋值
        name = "HS"
        //没有对opt进行赋值操作，也没有赋初始值，默认被赋值为nil
    }
}

class MyClassTwo{
    var age = 25
    var name = "HS"
}
//使用默认的init构造方法进行实例的构造
var obj = MyClassTwo()
//将打印age:25name:HS
print("age:\(obj.age)name:\(obj.name)")

struct MyStruct {
    var age:Int = 0
    var name:String
    init(age:Int,name:String){
        self.age = age
        self.name = name
    }
    //这个构造方法中调用其他构造方法
    init(){
        self.init(age:24,name: "HS")
    }
}
//使用无参的构造方法依然可以将age设置为24 name设置HS
var st = MyStruct()
print("age:\(st.age)name:\(st.name)")


//创建一个类作为基类
class BaseClass {
    //提供一个指定构造方法
    init(){
        print("BaseClass Designated")
    }
    //提供一个便利构造方法 
    //便利构造方法必须调用当前类中的其他构造方法 并最终调用到指定构造方法
    convenience init(param:String){
        print("BaseClass Convenience")
        //进行指定构造方法的调用
        self.init()
    }
}
//创建一个BaseClass的子类
class SubClass:BaseClass{
    //覆写指定构造方法中必须调用父类的指定构造方法
    override init(){
        super.init()
    }
    //提供两个遍历构造方法
    convenience init(param:String) {
        //最终调用到某个指定构造方法
        self.init()
    }
    convenience init(param:Int){
        //调用另一个遍历构造方法
        self.init(param:"HS")
    }
}
var obj2 = SubClass()

//创建一个基类
class BaseCls {
    //提供两个指定构造方法
    init(){
        print("BaseCls init")
    }
    init(param:Int){
        print("BaseCls init\(param)")
    }
    //提供一个便利构造方法
    convenience init(param:String){
        //调用其他构造方法
        self.init()
    }
}
//此类中不进行任何构造方法的定义 默认会继承父类的所有构造方法
class SubClsOne:BaseCls{
    
}

//这个类中对父类的无参init()指定构造方法进行的覆写
class SubClsTwo: BaseCls {
    //覆写了无参的init()构造方法，则不再继承父类其他构造方法
    override init(){
        super.init()
    }
}

//这个类没有覆写父类的构造方法，但是通过函数重载的方式定义了自己的构造方法
class SubClsThree:BaseCls{
    //重载了一个新的构造方法 则不再继承父类的其他构造方法
    init(param:Bool){
        super.init()
    }
}
//这个类覆写了父类的所有的指定构造方法 则会默认继承下来父类的便利构造方法
class SubClsFour:BaseCls{
    override init(param:Int){
        super.init(param:param)
    }
    override init(){
        super.init()
    }
}

//创建一个类作为基类
class Check {
    var property:Int
    //此构造方法必须被子类实现
    required init(param:Int){
        property = param
    }
    init?(param:Bool){
        //使用守护语句 当param为true时才进行构造
        guard param else{
            return nil
        }
        property = 1
    }
    var name:Int = {
       return 6+6
    }()
    
    
}
//将返回nil
var check = Check(param: true)
check?.name
//创建继承与Check类的子类
class SubCheck:Check{
    var subProperty:Int
    init(){
        //检查原则1：必须在调用父类的指定构造方法前 完全本身属性的赋值
        subProperty = 1
        super.init(param: 0)
        //检查原则2：如果子类要重新赋值父类继承来的属性 必须在调用父类的指定构造方法后
        property = 2
        //检查原则4：在完成父类的构造方法之后，才能使用self关键字
        self.subProperty = 2
    }
    convenience init(param:Int,param2:Int){
        self.init()
        //检查原则3：便利构造方法中要修改属性的值必须在调用指定构造方法之后
        subProperty = param
        property = param2
    }
     required init(param:Int){
        subProperty = 0
        super.init(param: param)
    }
}

class Temp {
    deinit{
        print("Temp实例被销毁")
    }
}
var temp:Temp? = Temp()
//当可选类型的类实例变量被赋值为nil时，实例会被释放
temp=nil


//1.设计游戏中的子弹和敌人类，假设这是一款一维直线上的射击游戏，敌人的移动速度是10单位/帧，子弹的飞行速度是30单位/帧，当子弹碰到敌人后，子弹和敌人同时销毁。
//设计子弹类
class Bullet{
    //提供一个属性描述子弹的位置
    var place:Int
    //提供一个类属性描述子弹的飞行速度
    static var speed:Int = 30
    //提供飞行方法描述飞行的行为
    func fly() {
        self.place += Bullet.speed
    }
    //提供一个构造方法
    init(place:Int) {
        self.place = place
    }
    //实现析构方法
    deinit {
        print("子弹命中")
    }
}
//设计敌人类
class Enemy{
    //提供一个属性描述敌人的位置
    var place:Int
    //提供一个类属性描述敌人逃逸的速度
    static var speed:Int = 10
    //提供一个方法描述敌人逃逸的行为
    func escape()  {
        self.place+=Enemy.speed
    }
    //提供一个构造方法
    init(place:Int) {
        self.place=place
    }
    deinit {
        print("敌人被击中")
    }
}

//创建子弹实例与敌人实例
var bullet:Bullet? = Bullet(place: 0)
var enemy:Enemy? = Enemy(place:300)
//记录追击回合
var i=0
//命中判断
while bullet!.place<enemy!.place {
    bullet!.fly()
    enemy!.escape()
    i+=1
    print("追击\(i)回合")
}
//将敌人和子弹一起销毁
bullet=nil
enemy=nil




