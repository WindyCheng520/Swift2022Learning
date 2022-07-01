import UIKit

//Memento 备忘录模式
//备忘录就是游戏存档。


//官方定义
//
//在不破坏封装性的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。
//
//这个模式有两个角色，一个是要存储的类型本身(Memento)和执行存储操作的保管人(Caretaker)。

typealias Memento = [String: String] // chatper: level
protocol MementoConvertible {
    var memento: Memento { get }
    init?(memento: Memento)
}

class GameState: MementoConvertible {
    var memento: Memento {
        return [chapter: level]
    }
    var chapter: String
    var level: String

    required init?(memento: Memento) {
        self.chapter = memento.keys.first ?? ""
        self.level = memento.values.first ?? ""
    }
    init(chapter: String, level: String) {
        self.chapter = chapter
        self.level = level
    }
}

protocol CaretakerConvertible {
    static func save(memonto: Memento, for key: String)
    static func loadMemonto(for key: String) -> Memento?
}

class Caretaker: CaretakerConvertible {
    static func save(memonto: Memento, for key: String) {
        let defaults = UserDefaults.standard
        defaults.set(memonto, forKey: key)
        defaults.synchronize()
    }

    static func loadMemonto(for key: String) -> Memento? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: key) as? Memento
    }

}

let g = GameState(chapter: "Prologue", level: "0")
// after a while
g.chapter = "Second"
g.level = "20"
// want a break
Caretaker.save(memonto: g.memento, for: "gamename")
// load game
let gameState = Caretaker.loadMemonto(for: "gamename") // ["Second": "20"]






//demo2
import Foundation

//假设一款游戏里，一个角色有生命，蓝量两个状态，当用户要打boss前，可以先备份一下，打之前状态，发现打不过时，可以重新开始，从头打BOSS

struct RollState {
    var life: Int
    var blue: Int
}

class Roll {
    var state: RollState
    init(state: RollState) {
        self.state = state
    }
    func saveState() -> RollState {
        return state
    }
    func restoreState(state: RollState) {
        self.state = state
    }
    func kill() {
        state.life = 0
        state.blue = 0
    }
}

let state = RollState(life: 100, blue: 100)//初始化角色
let roll = Roll(state: state)

let mementoState = roll.saveState()
print(dump(roll))
/*打印角色初始状态
▿ Memento.Roll #0
▿ state: Memento.RollState
- life: 100
- blue: 100
Memento.Roll
*/
roll.kill()
print(dump(roll))
/*角色死亡状态
▿ Memento.Roll #0
▿ state: Memento.RollState
- life: 0
- blue: 0
Memento.Roll
*/
roll.restoreState(state: mementoState)
print(dump(roll))
/*角色恢复后状态
▿ Memento.Roll #0
▿ state: Memento.RollState
- life: 100
- blue: 100
Memento.Roll
*/

