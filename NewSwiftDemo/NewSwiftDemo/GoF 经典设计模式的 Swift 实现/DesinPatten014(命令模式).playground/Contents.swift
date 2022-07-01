import UIKit


//Command 命令模式
//命令模式就是一种指令系统。
//
//官方定义
//
//将一个请求封装成一个对象，从而使您可以用不同的请求对客户进行参数化。
//
//命令模式有两个特征：
//
//命令逻辑对象化，这个命令对象可以从外界通过参数传入，也可内部实现。
//支持undo，因为每个命令对象自己知道如何撤销（反命令），所以可以封装到命令对象内部。


protocol Command {
    var operation: () -> Void { get }
    var backup: String { get }
    func undo()
}

struct ConcreteCommand: Command {
    var backup: String
    var operation: () -> Void
    func undo() {
        print(backup)
    }
}

struct Invoker {
    var command: Command
    func execute() {
        command.operation()
    }
    func undo() {
        command.undo()
    }
}

let printA = ConcreteCommand(backup: "Default A") {
    print("A")
}
let i1 = Invoker(command: printA)
i1.execute() // OUTPUT: A

let printB = ConcreteCommand(backup: "Default B") {
    print("B")
}
let i2 = Invoker(command: printB)
i2.execute() // OUTPUT: B
i2.undo() // OUTPUT: Default B




//demo2
import Foundation

enum DoorActionType {
    case open, close, lock, unlock
}


//命令协议，命令需要实现execute方法
protocol CommandProtocol {
    func execute()
}


//门
struct Door {
    var name: String
}


//门可以执行的操作：开门，关门，上锁，解锁
class DoorAction: CommandProtocol {

    var actionType: DoorActionType
    var door: Door

    init(type: DoorActionType ,door: Door) {
        actionType = type
        self.door = door
    }
    func execute() {
        switch actionType {
        case .open:
            print("\(door.name)执行开门命令！")
        case .close:
            print("\(door.name)执行关门命令！")
        case .lock:
            print("\(door.name)执行上锁命令！")
        case .unlock:
            print("\(door.name)执行解锁命令！")
        }
    }
}


//命令管理者
class DoorManager {

    var actions = [CommandProtocol]()
//添加命令
    func add(_ actions: CommandProtocol...) {
        self.actions += actions
    }
//执行命令
    func execute() {
        _ = actions.map{$0.execute()}
    }
}


//实例化了一个门，定义了门的动作
let door = Door(name: "客厅门")
let open = DoorAction(type: .open, door: door)
let close = DoorAction(type: .close, door: door)
let lock = DoorAction(type: .lock, door: door)
let unlock = DoorAction(type: .unlock, door: door)
//实例化了门管理者
let manager = DoorManager()
//添加门的动作
manager.add(open, close, lock, unlock)
//执行添加了的命令
manager.execute()
/*
客厅门执行开门命令！
客厅门执行关门命令！
客厅门执行上锁命令！
客厅门执行解锁命令！
*/
