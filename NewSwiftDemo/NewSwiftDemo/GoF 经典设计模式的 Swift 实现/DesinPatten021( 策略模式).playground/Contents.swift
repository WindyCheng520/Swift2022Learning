import UIKit
import Foundation

//Strategy 策略模式
//策略模式就像不同的交通路线，可以相互替换，都能达到终点。

//官方定义
//
//定义一系列的算法,把它们一个个封装起来, 并且使它们可相互替换。
//
//这个模式主要还是在解决一个稳定的继承树当遇到需求变化时的狼狈。他把变化的几种情况分门别类的封装好，然后把自己变化的部分隔离成一个接口实例(interface/protocol)，让子类继承后来做选择题。
//
//一个需要转变的思维就是：建模一个类的时候不能只局限于物体（object），也可以是行为（behavior）的封装。
//
//用继承来替换interface实现多态的behavior也是理论可行的。
//这个模式还有一个强大之处：他是动态的。就是至于子类选择了什么行为，不见得是写代码的时候写死的；也可以是类似用户点击一下切换了算法。

protocol WeaponBehavior {
    func use()
}

class SwordBehavior: WeaponBehavior {
    func use() { print("sword") }
}

class BowBehavior: WeaponBehavior {
    func use() { print("bow") }
}

class Character {
    var weapon: WeaponBehavior?
    func attack() {  weapon?.use() }
}

class Knight: Character {
    override init() {
        super.init()
        weapon = SwordBehavior()
    }
}

class Archer: Character {
    override init() {
        super.init()
        weapon = BowBehavior()
    }
}

///////////////////////////////////

Knight().attack() // output: sword
Archer().attack() // output: bow





//Demo2

//定义了金钱的算法acceptcash，分别实现
protocol CashBase {
    //所有计算都要遵循该协议，实现该方法
    func acceptCash(cash: CGFloat) -> CGFloat
}

//正常
class CashNormal: CashBase {
    func acceptCash(cash: CGFloat) -> CGFloat {
        return cash
    }
}

//打折
class CashRobate: CashBase {

    var moneyRebate: CGFloat

    init(rebate: CGFloat) {
        moneyRebate = rebate
    }

    func acceptCash(cash: CGFloat) -> CGFloat {
        return moneyRebate * cash
    }
}


//减免
class CashReturn: CashBase {

    var moneyReturn: CGFloat

    init(retur: CGFloat) {
        moneyReturn = retur
    }

    func acceptCash(cash: CGFloat) -> CGFloat {
        return cash - moneyReturn
    }
}


enum CashType {
    case Normal
    case Robate
    case Return
}

class CashContext {

    var cashBase: CashBase

    init(type: CashType) {
        switch type {
        case .Normal:
            cashBase = CashNormal()
        case .Robate:
            cashBase = CashRobate(rebate: 0.5)
        case .Return:
            cashBase = CashReturn(retur: 10)
        }
    }

    func getResult(money: CGFloat) -> CGFloat {
        return cashBase.acceptCash(cash: money)
    }
}

//使用不同的算法，获得不同的结果
let context = CashContext(type: .Normal)
print("Normal结果：\(context.getResult(money: 100))")//Normal结果：100

let retur = CashContext(type: .Return)
print("Retrun结果：\(retur.getResult(money: 100))")//Retrun结果：90

let robate = CashContext(type: .Robate)
print("Robate结果：\(robate.getResult(money: 100))")//Robate结果：50
