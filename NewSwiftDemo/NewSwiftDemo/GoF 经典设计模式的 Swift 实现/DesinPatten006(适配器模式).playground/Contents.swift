import UIKit

//Adapter 适配器模式
//适配器就像一个电源转换插头。

//官方定义
//
//将一个类的接口转换成客户希望的另外一个接口。适配器模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作。
//
//一个类能称之为适配器，就是指它能把另一个类进行某种变形，让其能和实际需求对接。
//比如一个底层数据模型，可以通过不同的UI适配器，对应不同的展现需要。

protocol Target {
    var value: String { get }
}

struct Adapter: Target {
    let adaptee: Adaptee
    var value: String {
        return "\(adaptee.value)"
    }
    init(_ adaptee: Adaptee) {
        self.adaptee = adaptee
    }
}

struct Adaptee {
    var value: Int
}

Adapter(Adaptee(value: 1)).value // "1"




//demo2

//假如说游戏a中，asdw按钮分别代表游戏角色 左 下 右 上 移动，但是在游戏b中，asdw分别代表 左 蹲下 跳跃 右 的动作，此时，适配器模式就体现出用途了，游戏b写一个适配器即可使用asdw按键

//游戏协议，分别定义出asdw四个键按下后需要实现的方法
protocol AdapterProtocol {

    func a()
    func s()
    func d()
    func w()
}

//游戏对应的适配器
class AdapterGameA: AdapterProtocol {
    var game: GameA
    init(game: GameA) {
        self.game = game
    }
    func a() {
        game.left()
    }
    func s() {
        game.down()
    }
    func d() {
        game.right()
    }
    func w() {
        game.up()
    }
}

class AdapterGameB: AdapterProtocol {
    var game: GameB
    init(game: GameB) {
        self.game = game
    }
    func a() {
        game.left()
    }
    func s() {
        game.squat()
    }
    func d() {
        game.right()
    }
    func w() {
        game.jump()
    }
}

//两款游戏
class GameA {
    func left() {
        print("\(String(describing: self))左移动游戏角色")
    }
    func down() {
        print("\(String(describing: self))下移动游戏角色")
    }
    func right() {
        print("\(String(describing: self))右移动游戏角色")
    }
    func up() {
        print("\(String(describing: self))上移动游戏角色")
    }
}


class GameB {
    func left() {
        print("\(String(describing: self))左移动游戏角色")
    }
    func squat() {
        print("\(String(describing: self))蹲下游戏角色")
    }
    func right() {
        print("\(String(describing: self))右移动游戏角色")
    }
    func jump() {
        print("\(String(describing: self))跳起游戏角色")
    }
}


//定义出游戏ab，分别指定适配器
let gameA = GameA()
let gameB = GameB()
let adapterA = AdapterGameA(game: gameA)
let adapterB = AdapterGameB(game: gameB)
//游戏开始了，分别按下asdw按键
adapterA.a()//Adapter.GameA左移动游戏角色
adapterA.s()//Adapter.GameA下移动游戏角色
adapterA.d()//Adapter.GameA右移动游戏角色
adapterA.w()//Adapter.GameA上移动游戏角色
adapterB.a()//Adapter.GameB左移动游戏角色
adapterB.s()//Adapter.GameB蹲下游戏角色
adapterB.d()//Adapter.GameB右移动游戏角色
adapterB.w()//Adapter.GameB跳起游戏角色
