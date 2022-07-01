import UIKit

//Bridge 桥接模式
//桥接模式就是这么一座桥，它矗立在具体和抽象之间，当你调用的时候只看到了抽象，但是它内部实现时“桥接”到了具体。

//官方定义
//
//将抽象部分与实现部分分离，使它们都可以独立的变化。
//
//桥接模式是继工厂模式之后另一个有点绕的概念，为了不一言不合就抛概念把大家绕晕，我们直接来看一下这个模式最终成型的样子。

//首先假设我们封装了一个“开关能力”的接口。

protocol 开关能力 {
    func turnOn(_ on: Bool)
}

//
//这个接口只有一个方法，实现者需要提供打开/关闭开关会触发什么操作。
//
//然后我们抽象一个叫“设备”的类出来，这个类就有意思了：
//
//首先他有一个实现了开关能力的实例变量，并通过初始化赋好值。
//他有一个方法的实现就是直接提供了开关能力里的实现。
class 设备 {
    let obj: 开关能力
    func turnOn(_ on: Bool) {
        obj.turnOn(on)
    }
    init(_ obj: 开关能力) {
        self.obj = obj
    }
}


//这样，其实一个桥接模式就已经搭建完了。再讲解之前，我们直接看一下如何应用它：
class 电视: 开关能力 {
    func turnOn(_ on: Bool) {
        if on {
            // 打开电视
        } else {
            // 关闭电视
        }
    }
}

class 空调: 开关能力 {
    func turnOn(_ on: Bool) {
        if on {
            // 打开空调
        } else {
            // 关闭空调
        }
    }
}

let tv = 设备(电视())
tv.turnOn(true) // 打开电视

let aircon = 设备(空调())
aircon.turnOn(false) // 关闭空调



//通过这段代码可以看出：
//
//在把抽象的设备应用到具体的业务的时候，这个模式采用的是组合了一个实现了开关能力接口的实例，而没用继承。
//最终调用的时候，是由统一的设备作为接入点的，而不是电视，空调这些具体类，具体的实现是通过组合的方式注入到设备里的。
//了解了这个流程后，一个事情就明朗了：
//
//这不就是在用组合代替继承吗？
//
//没错，它把需要变化的代码通过接口代理出去，而避免了继承。
//
//但是，桥接模式的桥在哪里？

//这时，要搬出他的概念了：
//Bridge pattern - Wikipedia：
//
//The bridge pattern is a design pattern used in software engineering which is meant to "decouple an abstraction from its implementation so that the two can vary independently".
//桥接模式解耦了抽象和具体，让它们可以独立变化。
//
//从代码去寻找具体和抽象，就可以发现：

//这座桥能走通的关键就是这个组合在抽象类里的变量。
//
//最后，你会发现，这不就是Adapter和Adaptee吗？
//没错，设计模式其实是连续剧来着。
//
//不同在于适配器的关注点是如何让两个不兼容的类对接，
//而桥接模式关注点是解耦。




//demo2
import Foundation

//接口协议
protocol InterfaceProtocol {
    var app: RealizeProtocol {get set}
    func open()
}

//实现协议
protocol RealizeProtocol {
    func appOpen()
}

//操作类
class Control: InterfaceProtocol {
    var app: RealizeProtocol
    init(app: RealizeProtocol) {
        self.app = app
    }
    func open() {
        app.appOpen()
    }
}

//地图
class Map: RealizeProtocol {
    func appOpen() {
        print("打开地图，开始定位！")
    }
}

//相机
class Camera: RealizeProtocol {
    func appOpen() {
        print("打开摄像头，开始拍照！")
    }
}

let map = Map()
let camera = Camera()
//把对应app给控制类，运行控制类的抽象接口，则会运行app的接口实现
let control = Control(app: map)
control.open()//打开地图，开始定位！
control.app = camera
control.open()//打开摄像头，开始拍照！


