import UIKit

func Test() {
    //变量a的作用域为整个函数内
    var a = 10
    while a>0 {
        a -= 1
        //变量b的作用域为while循环块内 除了while循环 变量b将被销毁 其占用的空间将被释放
        var b = 2
    }
    if a<0 {
        //变量c的作用域为if语句块内 if语句块结束后 变量c将被销毁 其占用的空间将释放
        var c = 3
    }
}

class TestClass {
    //name属性与当前类的实例关联 其生命周期与当前类实例一致
    var name:String = "HS"
    deinit{
        print("TestClass deinit")
    }
}
//创建TestClass实例的时候 其中属性name被构造，为其分配内存空间
//var obj:TestClass? = TestClass()
////obj实例被销毁 其中属性也随同一起销毁 释放所占有的内存空间
//obj=nil


//if true {
//    var a = 0
//    if true {
//        var b = 1
//        a = b
//    }
//    //此处变量b所占内存被释放
//}
////此处变量a所占内存被释放


//if true {
//    var a = TestClass()
//    if true {
//        var b = a
//    }
//    //此处变量b变量已经不存在 但是TestClass示例依然占有内存，没有被释放
//}
//此处变量a已经不存在 没有其他变量在引用TestClass()实例的 其所占内存被释放 调用deinit方法

var cls1:TestClass?=TestClass()
//进行引用类型的值的传递
var cls2 = cls1
var cls3 = cls2
//cls2对实例的引用取消 由于cls1与cls3的引用还在 实例所占内存依然安全
//cls2 = nil
////cls1对实例的引用取消 由于cls3的引用还在 实例所占内存依然安全
//cls1 = nil
////cls3对实例的引用取消 此时不再有变量对实例进行引用 实例调用deinit方法，所占内存被释放
//cls3 = nil


//循环引用
class ClassOne{
    //进行弱引用
    weak var cls:ClassTwo?
    deinit{
        print("ClassOne deinit")
    }
}
class ClassTwo{
    var cls:ClassOne?
    init(cls:ClassOne?){
        self.cls = cls
    }
    deinit{
        print("ClassTwo deinit")
    }
}

var obj:ClassOne? = ClassOne()
var obj2:ClassTwo? = ClassTwo(cls: obj)
obj?.cls = obj2
obj2=nil
obj=nil



class ClassThree{
    //不是Optional指 不能进行弱引用
    unowned var cls:ClassFour
    init(cls:ClassFour){
        self.cls = cls
    }
    deinit{
        print("ClassFour deinit")
    }
}
class ClassFour{
    //这与需要使用隐式拆包的方式
    var cls:ClassThree!
    init(){
        //在创建cls属性的时候 将当前类示例本身作为参数传入 
        //由构造方法的原则可知 在cls属性创建完成之前，不可以使用self属性
        //对于隐式解析类型的属性 上述原则可以忽略 其告诉编译器 默认此属性是构造完成的
        cls = ClassThree(cls: self)
    }
    deinit{
        print("ClassThree deinit")
    }
}
var obj5:ClassFour? = ClassFour()
obj5=nil

class MyClassSix {
    var name:String = "HS"
    lazy var closure:()->Void = {
        //使用捕获列表对闭包中使用到的self进行无主引用的转换
        [unowned self]()->Void in
        //闭包中使用引用值会使引用+1
        print(self.name)
    }
    deinit{
        print("ClassSix deinit")
    }
}
var obj6:MyClassSix? = MyClassSix()
obj6?.closure
//通过打印信息可以看出 内存已经被释放
obj6=nil




