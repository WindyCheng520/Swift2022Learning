import UIKit

//Observer 观察者模式
//观察者模式就像预购，支付了就坐等收货，省心省力。

//官方定义
//
//定义对象间的一种一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象都得到通知并被自动更新。
//
//观察者模式定义了对象之间的一对多依赖，这样一来，当一个对象改变状态时，它的所有依赖者都会收到通知并自动更新。
//
//观察者模式适用在一个被观察者（数据源）要通知多个观察者的场景。
//
//这个模式主要通过添加一层接口，来把观察者的具体类型擦除，从何实现松耦合。（针对接口编程，而非实现）
//
//观察者模式一个最重要的特点就是它是一种推模型(PUSH)，在很多情况下比拉模型更高效和即时。

protocol Observable {
    var observers: [Observer] { get }
    func add(observer: Observer)
    func remove(observer: Observer)
    func notifyObservers()
}

class ConcreteObservable: Observable {
    var observers = [Observer]()
    func add(observer: Observer) {
        observers.append(observer)
    }
    func remove(observer: Observer) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    func notifyObservers() {
        observers.forEach { $0.update() }
    }
}

protocol Observer: AnyObject {
    func update()
}

class ConcreteObserverA: Observer {
    func update() { print("A") }
}

class ConcreteObserverB: Observer {
    func update() { print("B") }
}

//////////////////////////////////

let observable = ConcreteObservable()
let a = ConcreteObserverA()
let b = ConcreteObserverB()
observable.add(observer: a)
observable.add(observer: b)
observable.notifyObservers() // output: A B

observable.remove(observer: b)
observable.notifyObservers() // output: A




//demo2
import Foundation

enum NoticeType {
    case Lev1 //老板到公司门口了
    case Lev2 //老板进来办公室了
}


protocol ObserverProtocol {
//定义了一个协议，实现
    func notice(type: NoticeType)
}


//公司前台小妹
final class Reception {

    var observers: [ObserverProtocol]?

    func noticeLev1() {
        noticeEveryOne(lev: .Lev1)
    }

    func noticeLev2() {
        noticeEveryOne(lev: .Lev2)
    }

    private func noticeEveryOne(lev: NoticeType) {
        for obj in observers! {
            obj.notice(type: lev)
        }
    }
}


//好员工
class Staff: ObserverProtocol {

    func notice(type: NoticeType) {
        print("员工\(String(describing: self))说：老板来了就来了呗，一直在专心工作")
    }
}


//员工a
final class StaffA: Staff {

    override func notice(type: NoticeType) {
        switch type {
        case .Lev1:
            print("员工\(String(describing: self))说：不怕，继续看动画。")
        default:
            print("员工\(String(describing: self))说：不怕，我是老板侄儿，他不会骂我的。")
        }
    }
}


//员工B
final class StaffB: Staff {

    override func notice(type: NoticeType) {
        switch type {
        case .Lev1:
            print("员工\(String(describing: self))说：赶紧关了，打开Xcode。")
        default:
            print("员工\(String(describing: self))说：恩，这破电脑，现在才打开Xcode，还好老板一进来已经打开了。")
        }
    }
}

let staff1 = Staff()
let staff2 = StaffA()
let staff3 = StaffB()
let reception = Reception()
reception.observers = [staff1, staff2, staff3]
//公司员工123都关注前台小妹的通知，当老板快要进办公室时，小妹会通知所有人
reception.noticeLev1()//老板到公司门口了，小妹发通知
/*
员工Observer.Staff说：老板来了就来了呗，一直在专心工作
员工Observer.StaffA说：不怕，继续看动画。
员工Observer.StaffB说：赶紧关了，打开Xcode。
*/
reception.noticeLev2()//老板进办公室了，小妹发通知
/*
员工Observer.Staff说：老板来了就来了呗，一直在专心工作
员工Observer.StaffA说：不怕，我是老板侄儿，他不会骂我的。
员工Observer.StaffB说：恩，这破电脑，现在才打开Xcode，还好老板一进来已经打开了。
*/
