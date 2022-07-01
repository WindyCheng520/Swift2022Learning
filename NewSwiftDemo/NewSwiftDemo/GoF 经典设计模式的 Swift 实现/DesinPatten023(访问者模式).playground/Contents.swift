import UIKit

//Visitor 访问者模式
//访问者模式就像一个个酒店，他们都有接待你的接口，你入住后又会利用它的基础设施。

//官方定义
//
//主要将数据结构与数据操作分离。
//
//号称最复杂的设计模式，先看一下实现代码。

protocol Visitor {
    func visit(_ c: ComponentA)
    func visit(_ c: ComponentB)
}

struct ConcreteVisitor: Visitor {
    func visit(_ c: ComponentA) {
        c.featureA()
    }
    func visit(_ c: ComponentB) {
        c.featureB()
    }
}

protocol Component {
    func accept(_ v: Visitor)
}

struct ComponentA: Component {
    func featureA() {
        print("Feature A")
    }
    func accept(_ v: Visitor) {
        v.visit(self)
    }
}

struct ComponentB: Component {
    func featureB() {
        print("Feature B")
    }
    func accept(_ v: Visitor) {
        v.visit(self)
    }
}

let components: [Component] = [ComponentA(), ComponentB()]
components.forEach {
    $0.accept(ConcreteVisitor())
}








//dmeo2
import Foundation

//假设一个人要去访问朋友ABCD
//访客协议
protocol VisitorProtocol {
    func visit(planet: FriendA)
    func visit(planet: FriendB)
    func visit(planet: FriendC)
    func visit(planet: FriendD)
}

//朋友的协议
protocol FriendProtocol {
    func accept(vistor: VisitorProtocol)
}

//A
class FriendA: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//B
class FriendB: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//C
class FriendC: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//D
class FriendD: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//访客
class Visitor8: VisitorProtocol {
    var address = ""
    func visit(planet: FriendA) {
        address = "访问了朋友A"
    }
    func visit(planet: FriendB) {
        address = "访问了朋友B"
    }
    func visit(planet: FriendC) {
        address = "访问了朋友C"
    }
    func visit(planet: FriendD) {
        address = "访问了朋友D"
    }
}





//分别创建出朋友
let friends: [FriendProtocol] = [FriendA(), FriendB(), FriendC(), FriendD()]
//每个朋友都去访问
let visitors = friends.map{ (friend: FriendProtocol) -> Visitor8 in
let visitor = Visitor8()
//访问过后，自己的数据就变了
friend.accept(vistor: visitor)
  return visitor
}
print(dump(visitors))
/*
▿ 4 elements
▿ Visitor.Visitor #0
- address: "访问了朋友A"
▿ Visitor.Visitor #1
- address: "访问了朋友B"
▿ Visitor.Visitor #2
- address: "访问了朋友C"
▿ Visitor.Visitor #3
- address: "访问了朋友D"
[Visitor.Visitor, Visitor.Visitor, Visitor.Visitor, Visitor.Visitor]
*/




/*
▿ 4 elements
▿ Visitor.Visitor #0
- address: "访问了朋友A"
▿ Visitor.Visitor #1
- address: "访问了朋友B"
▿ Visitor.Visitor #2
- address: "访问了朋友C"
▿ Visitor.Visitor #3
- address: "访问了朋友D"
[Visitor.Visitor, Visitor.Visitor, Visitor.Visitor, Visitor.Visitor]
*/
