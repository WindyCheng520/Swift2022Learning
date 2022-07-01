import UIKit

//https://xiaozhuanlan.com/topic/1357986204

//https://www.codercto.com/a/104950.html

//工厂模式顾名思义，就像一个工厂生产你所需要的产品
//无工厂 Non-Factory
//也就是工厂问题想解决的原始问题。


protocol Product {}
class ConcreteProductA: Product {}
class ConcreteProductB: Product {}

class Client {
    func createProduct(type: Int) -> Product {
        if type == 0 {
            return ConcreteProductA()
        } else {
            return ConcreteProductB()
        }
    }
}

let c = Client()
c.createProduct(type: 0) // get ConcreteProductA

//从代码和UML可以看出，为了得到产品A，调用者Client要同时依赖Product, ConcreteProductA和ConcreteProductB，并亲自写一个创建产品的方法。
//每当需求新增一个产品，就要改动到调用方Client。如果这一堆创建代码如果可以抽离出去就好了，于是简单工厂出现了。


//简单工厂 Simple Factory
//简单工厂就做了一件事，把Client要做的创建工作，挪到了另一个类里。

protocol Product1 {}
class ConcreteProductA1: Product1 {}
class ConcreteProductB1: Product1 {}

class Client1 {
    let s = Factory1()
}

class Factory1 {
    func createProduct(type: Int) -> Product1 {
        if type == 0 {
            return ConcreteProductA1()
        } else {
            return ConcreteProductB1()
        }
    }
}

let c1 = Client1()
c1.s.createProduct(type: 0) // get ConcreteProductA

//Factory代替了Client对具体Product的依赖，那么当需求变化的时候，我们不再需要改动调用方。这固然有所进步，但无法避免的是，每次变动都要在createProduct的方法内部新增一个if-else分支，这显然违背了开闭原则。
//
//为了解决这个问题，我们引入另一个模式。






//工厂方法 Factory Method
//官方定义
//
//定义一个创建对象的接口，让其子类自己决定实例化哪一个工厂类，工厂模式使其创建过程延迟到子类进行。
protocol Product2 {}
class ConcreteProductA2: Product2 {}
class ConcreteProductB2: Product2 {}

class Client2 {
    let f = Factory2()
}

class Factory2 {
    func createProduct() -> Product2? { return nil } // 用于继承
    func createProduct(type: Int) -> Product2? { // 用于调用
        if type == 0 {
            return ConcreteFactoryA().createProduct()
        } else {
            return ConcreteFactoryB().createProduct()
        }
    }
}

class ConcreteFactoryA: Factory2 {
    override func createProduct() -> Product2? {
        // ... 产品加工过程
        return ConcreteProductA2()
    }
}

class ConcreteFactoryB: Factory2 {
    override func createProduct() -> Product2? {
        // ... 产品加工过程
        return ConcreteProductB2()
    }
}

let c2 = Client2()
c2.f.createProduct(type: 0) // get ConcreteProductA
//对于工厂方法的实现，有众多不同的解法，比如Factory只保留一个createProduct让子类实现，让Client来选择生成哪个具体工厂实例；或是引入一个FactoryMaker的中间层，作为生产工厂的“简单工厂”。我这里采用的方式是Factory既作为工厂父类，让具体工厂决定生产生么产品，又作为接口类，让Client可以通过依赖注入选择特定工厂。我这样做的目的是，在不引入新的中间层的情况下，最小化Client的依赖。
//
//工厂方法在简单工厂的基础上做了两件事：
//
//多了一层抽象，把生产产品的工作延迟到子类执行。
//把“选择如何生产产品的工作”转化为“选择让哪个具体工厂生产”。
//工厂方法的贡献在于，这样做虽然不能完美避免对一个if-else的扩展，但是这个扩展规模被极大限制住了（只需要new一个类）。
//
//工厂方法着重点是解决了单一产品线的派生问题。那如果有多个相关产品线呢？






//demo2

import Foundation

//定义一个总的工厂类，让其子类决定创建出什么样的对象
class Factory {
    func createProduct() -> String {
        return "电视"
    }
}

//长虹子类决定只创建长虹电视
class ChangHoneFactory: Factory {
    override func createProduct() -> String {
        return "长虹电视"
    }
}

//海尔子类只创建海尔电视
class HaierFactory: Factory {
    override func createProduct() -> String {
        return "海尔电视"
    }
}

//不同的工厂子类决定了要生成的实例
var factory: Factory = ChangHoneFactory()
print("创建出了:\(factory.createProduct())")//创建出了:长虹电视
factory = HaierFactory()
print("创建出了:\(factory.createProduct())")//创建出了:海尔电视






