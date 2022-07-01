import UIKit

//Mediator 中介模式
//中介模式是对象间发消息的传话筒。

//官方定义
//
//用一个中介对象来封装一系列的对象交互，中介者使各对象不需要显式地相互引用，从而使其耦合松散，而且可以独立地改变它们之间的交互。
//
//中介模式对于通信关系复杂的系统有很好的解耦效果
//
//它和观察者模式很像，区别在于观察者是不关心接受方的广播，中介者是介入两个（或多个）对象之间的定点消息传递。

protocol Receiver {
    func receive(message: String)
}

protocol Mediator: AnyObject {
    func notify(message: String)
    func addReceiver(_ receiver: Receiver)
}

class ConcreteMediator: Mediator {
    var recipients = [Receiver]()
    func notify(message: String) {
        recipients.forEach { $0.receive(message: message) }
    }
    func addReceiver(_ receiver: Receiver) {
        recipients.append(receiver)
    }
}

protocol Component: Receiver {
    var mediator: Mediator? { get }
}

struct ConcreteComponent: Component {
    weak var mediator: Mediator?
    var name: String
    func receive(message: String) {
        print(name, " receive: ", message)
    }
}

var mediator = ConcreteMediator()

let c1 = ConcreteComponent(mediator: mediator, name: "c1")
let c2 = ConcreteComponent(mediator: mediator, name: "c2")
let c3 = ConcreteComponent(mediator: mediator, name: "c3")

mediator.addReceiver(c1)
mediator.addReceiver(c2)
mediator.addReceiver(c3)

//c1  receive:  hi
//c2  receive:  hi
//c3  receive:  hi
c1.mediator?.notify(message: "hi")




//demo
import Foundation

//制造协议
protocol CreateProtocol {
    var name: String {get set}
    func create() -> Any
}

//钢铁
struct Steel {
    var name: String
    var createFrom: String
}

//机器人结构体
struct Robot {
    var name: String
    var steel: Steel
    var createFrom: String
}

//优质造铁厂
class SteelFactory: CreateProtocol {
    var name: String
    init(name: String) {
        self.name = name
    }
    func create() -> Any {
        return Steel(name: "优质钢材", createFrom: name)
    }
}

//劣质造铁厂
class SteelFactoryLow: CreateProtocol {
    var name: String
    init(name: String) {
        self.name = name
    }
    func create() -> Any {
        return Steel(name: "劣质钢材", createFrom: name)
    }
}

//制造机器人的公司
class RobotCompany: CreateProtocol {
    var mediator: Mediator8
    var name: String
    init(mediator: Mediator8, name: String) {
        self.name = name
        self.mediator = mediator
    }
//机器人制造公司需要钢材，然后向中介者要钢材，中介者去向工厂要。中介者和工厂没有相互引用，工厂可以被替换。
    func create() -> Any {
        return Robot(name: "阿狸机器人", steel: mediator.needSteel(), createFrom: name)
    }
}

//中介者
class Mediator8 {
    var steelFactory: CreateProtocol
    init(stellFactory: SteelFactory) {
        self.steelFactory = stellFactory
    }
//向中介者要钢材
    func needSteel() -> Steel {
        return steelFactory.create() as! Steel
    }
}



let factory = SteelFactory(name: "成都钢铁厂")
let factoryLow = SteelFactoryLow(name: "劣质钢铁厂")
let mediator8 = Mediator8(stellFactory: factory)
let company = RobotCompany(mediator: mediator8, name: "成都机器人公司")
//开始制造
let robot = company.create() as! Robot
print(robot.createFrom+"制造的机器人\(robot.name)，采用的是"+robot.steel.createFrom+"生产的"+robot.steel.name+"！")//成都机器人公司制造的机器人阿狸机器人，采用的是成都钢铁厂生产的优质钢材！
//中介者更换了钢铁厂，钢铁厂和机器人公司是没有引用的

mediator8.steelFactory = factoryLow
let robot1 = company.create() as! Robot
print(robot1.createFrom+"制造的机器人\(robot1.name)，采用的是"+robot1.steel.createFrom+"生产的"+robot1.steel.name+"！")//成都机器人公司制造的机器人阿狸机器人，采用的是劣质钢铁厂生产的劣质钢材！

