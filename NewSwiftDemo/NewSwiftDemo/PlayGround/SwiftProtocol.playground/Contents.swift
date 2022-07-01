import UIKit
import Foundation


//https://swift.gg/2016/02/01/protocol-oriented-segue-identifiers-swift/


//https://swift.gg/2015/12/16/swift-qa-2015-12-16/#more


//https://swift.gg/2015/12/15/mixins-over-inheritance/
//尽量用协议而不是继承实现功能

protocol Flyer {
  func fly()
}

extension Flyer {
  func fly() {
    print("I believe I can flyyyyy ♬")
  }
}



class SuperMan: Flyer {
  // 这里我们没有实现 fly() 方法，因此能够听到 Clark 唱歌
}

//class IronMan: Flyer {
//  // 如果需要我们也可以给出单独的实现
//  func fly() {
//     print("I can‘t flyyyyy ♬")
//  }
//}


protocol TimeTraveler {
  var currentDate: Date { get set }
  mutating func travelTo(date: Date)
}


extension TimeTraveler {
  mutating func travelTo(date: Date) {
    currentDate = date
  }
}


class Character {
  var name: String
  init(name: String) {
    self.name = name
  }
}

class Human: Character {
  var countryOfOrigin: String?
  init(name: String, countryOfOrigin: String? = nil) {
    self.countryOfOrigin = countryOfOrigin
    super.init(name: name)
  }
}

class Alien: Character {
  let species: String
  init(name: String, species: String) {
    self.species = species
    super.init(name: name)
  }
}



class TimeLord: Alien, TimeTraveler {
    var currentDate: Date
  init() {
      self.currentDate = Date()
    super.init(name: "I'm the Doctor", species: "Gallifreyan")
  }
}

class DocEmmettBrown: Human, TimeTraveler {
    var currentDate: Date
    
  init() {
      self.currentDate = Date()
    super.init(name: "Emmett Brown", countryOfOrigin: "USA")
  }
}

class Superman: Alien, Flyer {
  init() {
    super.init(name: "Clark Kent", species: "Kryptonian")
  }
}

class IronMan: Human, Flyer {
  init() {
    super.init(name: "Tony Stark", countryOfOrigin: "USA")
  }
}


let tony = IronMan()
tony.fly() // 输出 "I believe I can flyyyyy ♬"
tony.name  // 返回 "Tony Stark"

let clark = Superman()
clark.fly() // 输出 "I believe I can flyyyyy ♬"
clark.species  // 返回 "Kryptonian"

var docBrown = DocEmmettBrown()
docBrown.travelTo(date: Date(timeIntervalSince1970: 499161600))
docBrown.name // "Emmett Brown"
docBrown.countryOfOrigin // "USA"
docBrown.currentDate // Oct 26, 1985, 9:00 AM

var doctorWho = TimeLord()
doctorWho.travelTo(date: Date(timeIntervalSince1970: 1303484520))
doctorWho.species // "Gallifreyan"
doctorWho.currentDate // Apr 22, 2011, 5:02 PM



protocol SpaceTraveler {
  func travelTo(location: String)
}


extension SpaceTraveler {
  func travelTo(location: String) {
    print("Let's go to \(location)!")
  }
}

extension TimeLord: SpaceTraveler {}
extension Superman: SpaceTraveler {}

doctorWho.travelTo(location: "Trenzalore") // prints "Let's go to Trenzalore!"



//下列继承相关代码错误

//// 来吧，Pond！
//let amy = Human(name: "Amelia Pond", countryOfOrigin: "UK")
//// 该死，她是一个时间和空间旅行者，但是却不是 TimeLord！
//
//class Astraunaut: Human, SpaceTraveler {}
//let neilArmstrong = Astraunaut(name: "Neil Armstrong", countryOfOrigin: "USA")
//let laika = Astraunaut(name: "Laïka", countryOfOrigin: "Russia")
//// 等等，Leïka 是一只狗，不是吗？
//
//class MilleniumFalconPilot: Human, SpaceTraveler {}
//let hanSolo = MilleniumFalconPilot(name: "Han Solo")
//let chewbacca = MilleniumFalconPilot(name: "Chewie")
//// 等等，MilleniumFalconPilot 不该定义成「人类」吧！
//
//class Spock: Alien, SpaceTraveler {
//  init() {
//    super.init(name: "Spock", species: "Vulcan")
//    // 并不是 100% 正确
//  }
//}


//
//struct Image {
//    lazy var metadata: [String:AnyObject] = {
//        // 加载图片和解析 metadata，相当占内存
//        // ...
//        return ...
//    }()
//}




struct Counter {
    // 现在就只有setter是private的了！
    private(set) var count: Int
}



// This now works!!!
//String(MyTableViewCell)
