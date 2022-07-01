import UIKit
//
//State 状态模式
//状态模式就像马里奥吃了各种蘑菇后的变身。
//
//官方定义
//
//允许对象在内部状态发生改变时改变它的行为，对象看起来好像修改了它的类。
//
//状态模式很像策略模式，但是他封装的不是算法，而是一个一个本体下的不同状态。

protocol State {
    func operation()
}

class ConcreteStateA: State {
    func operation() {
        print("A")
    }
}

class ConcreteStateB: State {
    func operation() {
        print("B")
    }
}

class Context {
    var state: State = ConcreteStateA()
    func someMethod() {
        state.operation()
    }
}

let c = Context()
c.someMethod() // OUTPUT: A
c.state = ConcreteStateB() // switch state
c.someMethod() // OUTPUT: B




//demo2
import Foundation

enum MoodState {
    case happy, sad, normal
}

//状态
struct State1 {
    var mood: MoodState
}


//一个程序员
class Programmer {

    var state: State1

    init(state: State1) {
        self.state = state
    }

    func programming() {
        switch state.mood {
        case .happy:
            print("心情不错，开开心心的写程序")
        case .sad:
            print("心情糟糕，不想写程序")
        case .normal:
            print("心情正常，慢慢悠悠的写程序")
        }
    }
}

//修改programmer的state状态，即修改了programmer的programming()的行为
let happy = State1(mood: .happy)
let programmer = Programmer(state: happy)
programmer.programming()//心情不错，开开心心的写程序

let sad = State1(mood: .sad)
programmer.state = sad
programmer.programming()//心情糟糕，不想写程序

let normal = State1(mood: .normal)
programmer.state = normal
programmer.programming()//心情正常，慢慢悠悠的写程序
