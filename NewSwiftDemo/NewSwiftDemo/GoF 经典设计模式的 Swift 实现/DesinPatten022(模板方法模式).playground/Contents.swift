import UIKit

//Template Method 模板方法模式
//模板方法就是抽象类衍生出来的继承树。
//
//官方定义
//
//定义一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。
//
//模板方法指的就是存在在抽象类中的方法声明，由子类具体实现。这样这套方法产生了一套模具不同产品的派生效果。
//
//通过抽象类和子类实现多态。
//
//很可惜Swift/Objective-C都没有抽象类, 所以用一般的class来实现


class Soldier {
    func attack() {} // <-- Template Method
    private init() {} // <-- avoid creation
}

class Paladin: Soldier {
    override func attack() {
        print("hammer")
    }
}

class Archer: Soldier {
    override func attack() {
        print("bow")
    }
}





//demo2

import Foundation

//定义了一套问题模板
class Question {

    final func question() {
        print("如果有一天，不写程序了，你会去做什么？")
        print("我会去：\(answer())")
    }

//默认是养猪
    func answer() -> String {
        return "养猪"
    }
}

//子类修改answer方法来修改结果
class PersonA: Question {

    override func answer() -> String {
        return "下海经商"
    }
}


class PersonB: Question {

    override func answer() -> String {
        return "自己开公司"
    }
}

let s = Question()
s.question()
//如果有一天，不写程序了，你会去做什么？
//我会去：养猪

let a = PersonA()
a.question()
//如果有一天，不写程序了，你会去做什么？
//我会去：下海经商

let b = PersonB()
b.question()
//如果有一天，不写程序了，你会去做什么？
//我会去：自己开公司



