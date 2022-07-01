import UIKit

//Facade 外观模式
//外观模式就是化繁为简。
//
//官方定义
//
//为子系统中的一组接口提供一个一致的界面，外观模式定义了一个高层接口，这个接口使得这一子系统更加容易使用。
//
//值得一提的是，这个单词读音很怪。

//在谈起外观模式的时候，常常是指对一个复杂的(旧)代码库在不改变其内在的情况下，包装一层易于调用的表层API。
//
//外观模式不会采用继承，而是用接口和组合。

protocol Facade {
    func simpleMethod()
}

class LegacyCode {
    func someMethod1() { }
    func someMethod2() { }
}

extension LegacyCode: Facade {
    func simpleMethod() {
        someMethod1()
        someMethod2()
    }
}

class Client {
    let f: Facade = LegacyCode()
}

let c = Client()
c.f.simpleMethod()



//demo2
import Foundation

class Robot {
//只需要调用该接口即可，内部的子系统无需使用者依次调用
    static func creatRobot() {
        Head.createHead()
        Body.createBody()
        Arm.createArm()
        Leg.createLeg()
    }
}


class Head {
    static func createHead() {
        print("制造头")
    }
}

class Body {
    static func createBody() {
        print("制造身体")
    }
}

class Arm {
    static func createArm() {
        print("制造手臂")
    }
}

class Leg {
    static func createLeg() {
        print("制造腿")
    }
}

Robot.creatRobot()
/*
制造头
制造身体
制造手臂
制造腿
*/
