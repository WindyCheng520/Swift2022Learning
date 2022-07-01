import UIKit
import Foundation
//Decorator 装饰者模式
//如果点咖啡时价格的计算是牛奶(糖(咖啡(价格: 19元)))就好了

//官方定义
//
//动态地给一个对象添加一些额外的职责。就增加功能来说，装饰器模式相比生成子类更为灵活。
//
//下面我们就用装饰者模式的思想来设计这个点咖啡程序:

protocol Component {
    var cost: Int { get }
}

protocol Decorator: Component {
    var component: Component { get }
    init(_ component: Component)
}

struct Coffee: Component {
    var cost: Int
}

struct Sugar: Decorator {
    var cost: Int {
        return component.cost + 1
    }
    var component: Component
    init(_ component: Component) {
        self.component = component
    }
}

struct Milk: Decorator {
    var cost: Int {
        return component.cost + 2
    }
    var component: Component
    init(_ component: Component) {
        self.component = component
    }
}

Milk(Sugar(Coffee(cost: 19))).cost

//当你的需求是零散的不断给“主菜加点佐料”的时候，并且这些佐料会经常变化，那么这个模式就可以有效的解决排列组合产生的类爆炸
//
//理解的一个关键点就是区分组件Component和装饰者Decorator两个角色，单纯组件的实现者（咖啡）是被装饰的对象，他不再能装饰别人。
//
//这个模式没有一个集中的计算器，每一个装饰者都参与了部分计算并输出当下的结果。




//demo2




protocol Phone {

    func call() -> String

    func video() -> String
}


class iPhone: Phone {

    func call() -> String {
        return "苹果打电话"
    }

    func video() -> String {
        return "苹果看电影"
    }
}

//父装饰器
class PhoneDecorator: Phone {

    var phone: Phone

    init(phone: Phone) {
        self.phone = phone
    }

    func call() -> String {
        return phone.call()
    }

    func video() -> String {
        return phone.video()
    }
}

//增加流量功能
final class PhoneDecoratorNet: PhoneDecorator {

    override func call() -> String {
        return "流量-\(phone.call())"
    }

    override func video() -> String {
        return "流量-\(phone.video())"
    }
}

//增加wifi功能
class PhoneDecoratorWifi: PhoneDecorator {

    override func call() -> String {
        return "WIFI-\(phone.call())"
    }

    override func video() -> String {
        return "WIFI-\(phone.video())"
    }
}

let phone = iPhone()

//装饰器增加了功能
var decorator = PhoneDecorator(phone: phone)
print(decorator.call())//苹果打电话
print(decorator.video())//苹果看电影

decorator = PhoneDecoratorNet(phone: phone)
print(decorator.call())//流量-苹果打电话
print(decorator.video())//流量-苹果看电影

decorator = PhoneDecoratorWifi(phone: phone)
print(decorator.call())//WIFI-苹果打电话
print(decorator.video())//WIFI-苹果看电影

