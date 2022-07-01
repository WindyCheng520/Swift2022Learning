import UIKit
import Foundation

//Proxy 代理模式
//代理模式让一个类成为了另一个类的实际接口。

//官方定义
//
//为其他对象提供一种代理以控制对这个对象的访问。
//
//有两种常见的代理场景：
//
//Protection proxy： 出于安全考虑，通过一个表层的类间接调用底层的类。
//Virtual proxy：出于性能考虑，通过一个低耗的类延迟调用一个高耗的类。
//但他们的实现是类似的：

protocol Subject {
    mutating func operation()
}

struct SecretObject: Subject {
    func operation() {
        // real implementation
    }
}

struct PublicObject: Subject {
    private lazy var s = SecretObject()
    mutating func operation() {
        s.operation()
    }
}

var p = PublicObject()
p.operation()
//SecretObject既可以看做一个隐藏类，又可以看做一个高费的类。通过PublicObject对他的代理，可以实现信息隐藏和延迟加载两个特性。




//demo2

//虚拟代理
protocol Action {

    func run()
    func cry()
}


class Children: Action {

    func run() {
        print("孩子跑了")
    }

    func cry() {
        print("孩子哭了")
    }
}


class Youth: Action {

    lazy private var children: Children = Children()

    func run() {
        children.run()
    }

    func cry() {
        children.cry()
    }
}


//保护代理

protocol Door {

    func open()
}


class Child: Door {

    func open() {
        print("好的，马上来开门！")
    }
}


class Parent: Door {

    private var child: Child!

    func haveChild(have: Bool) {

        guard have else {
            return
        }
        child = Child()
    }

    func open() {
        guard child != nil else {
            print("没有孩子，我自己来开门")
            return
        }
        child.open()
    }
}

//虚拟代理，youth控制了child的行为
let virtual = Youth()
virtual.run()//孩子跑了
virtual.cry()//孩子哭了

//保护代理，对于控制孩子开门这个行为，增加了一个保护，如果没有孩子这个实例，则自己去开门
let parent = Parent()
parent.open()//没有孩子，我自己来开门
parent.haveChild(have: true)
parent.open()//好的，马上来开门

