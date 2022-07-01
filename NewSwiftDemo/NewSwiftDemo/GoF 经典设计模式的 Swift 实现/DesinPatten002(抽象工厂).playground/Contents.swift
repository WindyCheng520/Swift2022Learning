import UIKit

//抽象工厂 Abstract Factory
//官方定义
//
//提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类。

protocol ProductA {}
class ConcreteProductA1: ProductA {}
class ConcreteProductA2: ProductA {}

protocol ProductB {}
class ConcreteProductB1: ProductB {}
class ConcreteProductB2: ProductB {}

class Client {
    let f = Factory()
}

class Factory {
    func createProductA() -> ProductA? { return nil } // 用于继承
    func createProductB() -> ProductB? { return nil } // 用于继承
    func createProductA(type: Int) -> ProductA? { // 用于调用
        if type == 0 {
            return ConcreteFactory1().createProductA()
        } else {
            return ConcreteFactory2().createProductA()
        }
    }
    func createProductB(type: Int) -> ProductB? { // 用于调用
        if type == 0 {
            return ConcreteFactory1().createProductB()
        } else {
            return ConcreteFactory2().createProductB()
        }
    }
}

class ConcreteFactory1: Factory {
    override func createProductA() -> ProductA? {
        // ... 产品加工过程
        return ConcreteProductA1()
    }
    override func createProductB() -> ProductB? {
        // ... 产品加工过程
        return ConcreteProductB1()
    }
}

class ConcreteFactory2: Factory {
    override func createProductA() -> ProductA? {
        // ... 产品加工过程
        return ConcreteProductA2()
    }
    override func createProductB() -> ProductB? {
        // ... 产品加工过程
        return ConcreteProductB2()
    }
}

let c = Client()
c.f.createProductA(type: 0) // get ConcreteProductA1
c.f.createProductA(type: 1) // get ConcreteProductA2
c.f.createProductB(type: 0) // get ConcreteProductB1
c.f.createProductB(type: 1) // get ConcreteProductB2

//图很吓人，其实很简单。
//
//当我们有两个相关的产品线ProductA和ProductB, 例如螺丝和螺母，他们派生出ProductA1，ProductB1 和 ProductA2，ProductB2，前者我们由工厂ConcreteFactory1来制作，后者由 ConcreteFactory2来制作。
//
//对于Client来说，他只需要知道有一个抽象的工厂能同时生产ProductA和ProductB就行了，那就是图中的Factory。
//
//重点来了，这个抽象的Factory是通过“工厂方法”模式把构造过程延迟到子类执行的，也就是说，抽象工厂是建立在工厂方法的基础上的模式。
//
//所以抽象工厂，换句话说，就是多个产品线需要绑定在一起，形成一个抽象的综合工厂，由具体的综合工厂来批量实现“工厂方法”的一种更“高级”的模式。
//
//总结
//有点绕，说完这些感觉我已经中文十级了。总之，我想表达的观点是：这些工厂模式并不是割裂的存在，而是一个递进的思想。






//demo2
import Foundation

//产品
protocol ProductProtocol {
    var factory: String { get set }
    func showYouself()
}


struct Television: ProductProtocol {
    var factory: String
    func showYouself() {
        print("\(factory)生产的电视")
    }
}


struct Refrigerator: ProductProtocol {
    var factory: String
    func showYouself() {
        print("\(factory)生产的冰箱")
    }
}


//工厂
enum ProductType {
    case Television, Refrigerator
}


class Factory8 {
    static func createProduct(type: ProductType) -> ProductProtocol {
        switch type {
        case .Television:
            return Television(factory: "工厂")
        default:
            return Refrigerator(factory: "工厂")
        }
    }
}

//工厂类提供了生产所有产品的接口，使用者无需知道要生产的具体类，只需要告诉工厂要的产品类型即可
let tv = Factory8.createProduct(type: .Television)
let bx = Factory8.createProduct(type: .Refrigerator)
tv.showYouself()//工厂生产的电视
bx.showYouself()//工厂生产的冰箱
