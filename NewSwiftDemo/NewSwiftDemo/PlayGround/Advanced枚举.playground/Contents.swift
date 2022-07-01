import UIKit

//enum Movement{
//    case Left
//    case Right
//    case Top
//    case Bottom
//}
//
//let aMovement = Movement.Left
//// switch 分情况处理
//switch aMovement{
//case .Left: print("left")
//default:()
//}
//// 明确的case情况
//if case .Left = aMovement{
//    print("left")
//}
//if aMovement == .Left { print("left") }

// 映射到整型
enum Movement: Int {
    case Left = 0
    case Right = 1
    case Top = 2
    case Bottom = 3
}
// 同样你可以与字符串一一对应
enum House: String {
    case Baratheon = "Ours is the Fury"
    case Greyjoy = "We Do Not Sow"
    case Martell = "Unbowed, Unbent, Unbroken"
    case Stark = "Winter is Coming"
    case Tully = "Family, Duty, Honor"
    case Tyrell = "Growing Strong"
}
// 或者float double都可以(同时注意枚举中的花式unicode)
enum Constants: Double {
    case π = 3.14159
    case e = 2.71828
    case φ = 1.61803398874
    case λ = 1.30357
}



//对于String和Int类型来说，你甚至可以忽略为枚举中的case赋值，Swift编译器也能正常工作。
// Mercury = 1, Venus = 2, ... Neptune = 8
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
// North = "North", ... West = "West"
// 译者注: 这个是swift2.0新增语法
enum CompassPoint: String {
    case North, South, East, West
}

//Swift枚举中支持以下四种关联值类型:
//整型(Integer)
//浮点数(Float Point)
//字符串(String)
//布尔类型(Boolean)

let bestHouse = House.Stark
print(bestHouse.rawValue)

// 创建一个movement.Right 用例,其raw value值为1,指定构造方法
let rightMovement = Movement(rawValue: 1)


//二进制枚举
enum VNodeFlags : UInt32 {
    case Delete = 0x00000001
    case Write = 0x00000002
    case Extended = 0x00000004
    case Attrib = 0x00000008
    case Link = 0x00000010
    case Rename = 0x00000020
    case Revoke = 0x00000040
    case None = 0x00000080
}



//枚举嵌套
enum Character {
  enum Weapon {
    case Bow
    case Sword
    case Lance
    case Dagger
  }
  enum Helmet {
    case Wooden
    case Iron
    case Diamond
  }
  case Thief
  case Warrior
  case Knight
}


let character = Character.Thief
let weapon = Character.Weapon.Bow
let helmet = Character.Helmet.Iron


//结构体或class 内嵌枚举
struct Character1 {
   enum CharacterType {
    case Thief
    case Warrior
    case Knight
  }
  enum Weapon {
    case Bow
    case Sword
    case Lance
    case Dagger
  }
  let type: CharacterType
  let weapon: Weapon
}


//枚举关联值
enum Trade {
    case Buy(stock: String, amount: Int)
    case Sell(stock: String, amount: Int)
}
func trade(type: Trade) {}


//模式匹配访问关联值
let trade = Trade.Buy(stock: "APPL", amount: 500)
if case let Trade.Buy(stock, amount) = trade {
    print("buy \(amount) of \(stock)")
}


//枚举关联值也可以去掉标签
enum Trade1 {
   case Buy(String, Int)
   case Sell(String, Int)
}

//
//let tp = (stock: "TSLA", amount: 100)
//let trade = Trade.Sell(tp)
//if case let Trade.Sell(stock, amount) = trade {
//    print("buy \(amount) of \(stock)")
//}



//元组参数别名
typealias Config = (RAM: Int, CPU: String, GPU: String)
// Each of these takes a config and returns an updated config
func selectRAM(_ config: Config) -> Config {return (RAM: 32, CPU: config.CPU, GPU: config.GPU)}
func selectCPU(_ config: Config) -> Config {return (RAM: config.RAM, CPU: "3.2GHZ", GPU: config.GPU)}
func selectGPU(_ config: Config) -> Config {return (RAM: config.RAM, CPU: "3.2GHZ", GPU: "NVidia")}
enum Desktop {
   case Cube(Config)
   case Tower(Config)
   case Rack(Config)
}
let aTower = Desktop.Tower(selectGPU(selectCPU(selectRAM((0, "", "") as Config))))


// 拥有不同值的用例
enum UserAction {
  case OpenURL(url: URL)
  case SwitchProcess(processId: UInt32)
  case Restart(time: Date?, intoCommandLine: Bool)
}
// 假设你在实现一个功能强大的编辑器，这个编辑器允许多重选择，
// 正如 Sublime Text : https://www.youtube.com/watch?v=i2SVJa2EGIw
enum Selection {
  case None
  case Single(Range<Int>)
  case Multiple([Range<Int>])
}
// 或者映射不同的标识码
enum Barcode {
    case UPCA(numberSystem: Int, manufacturer: Int, product: Int, check: Int)
    case QRCode(productCode: String)
}
// 又或者假设你在封装一个 C 语言库，正如 Kqeue BSD/Darwin 通知系统:
// https://www.freebsd.org/cgi/man.cgi?query=kqueue&sektion=2
enum KqueueEvent {
    case UserEvent(identifier: UInt, fflags: [UInt32], data: Int)
    case ReadFD(fd: UInt, data: Int)
    case WriteFD(fd: UInt, data: Int)
    case VnodeFD(fd: UInt, fflags: [UInt32], data: Int)
    case ErrorEvent(code: UInt, message: String)
}
// 最后, 一个 RPG 游戏中的所有可穿戴装备可以使用一个枚举来进行映射，
// 可以为一个装备增加重量和持久两个属性
// 现在可以仅用一行代码来增加一个"钻石"属性，如此一来我们便可以增加几件新的镶嵌钻石的可穿戴装备
enum Wearable {
    enum Weight: Int {
    case Light = 1
    case Mid = 4
    case Heavy = 10
    }
    enum Armor: Int {
    case Light = 2
    case Strong = 8
    case Heavy = 20
    }
    case Helmet(weight: Weight, armor: Armor)
    case Breastplate(weight: Weight, armor: Armor)
    case Shield(weight: Weight, armor: Armor)
}
//let woodenHelmet = Wearable.Helmet(weight: .Weight.Light, armor: .Armor.Light)



//枚举中定义方法和属性
enum Wearable1 {
    enum Weight: Int {
        case Light = 1
    }
    enum Armor: Int {
        case Light = 2
    }
    case Helmet(weight: Weight, armor: Armor)
        func attributes() -> (weight: Int, armor: Int) {
       switch self {
       case .Helmet(let w, _): return (weight: w.rawValue * 2, armor: w.rawValue * 4)
       }
    }
}
let woodenHelmetProps = Wearable1.Helmet(weight: .Light, armor: .Light).attributes()
print (woodenHelmetProps)
// prints "(2, 4)"


//枚举中只可以添加计算属性
enum Device {
  case iPad, iPhone
  var year: Int {
    switch self {
    case .iPhone: return 2007
    case .iPad: return 2010
     }
  }
}


//枚举中添加静态方法
enum Device1 {
    case AppleWatch
    static func fromSlang(term: String) -> Device1? {
      if term == "iWatch" {
      return .AppleWatch
      }
      return nil
    }
}
print (Device1.fromSlang(term: "iWatch") ?? "")


//枚举中添加可变方法
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
    switch self {
    case .Off:
        self = TriStateSwitch.Low
    case .Low:
        self = TriStateSwitch.High
    case .High:
        self = TriStateSwitch.Off
    }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight 现在等于.On
ovenLight.next()
// ovenLight 现在等于.Off


// Struct Example
struct Point {
    let x: Int
    let y: Int
    
}
struct Rect {
    let x: Int
    let y: Int
    let width: Int
    let height: Int
    
}
// Enum Example
enum GeometricEntity {
   case Point(x: Int, y: Int)
   case Rect(x: Int, y: Int, width: Int, height: Int)
}



// C-Like example
enum Trade2 {
   case Buy
   case Sell
}
func order(trade: Trade2){
    
}
// Swift Enum example
enum Trad3 {
   case Buy
   case Sell
    func order(){
        
    }
}



//枚举遵循协议
enum Trade100: CustomStringConvertible {
   case Buy, Sell
   var description: String {
       switch self {
       case .Buy: return "We're buying something"
       case .Sell: return "We're selling something"
       }
   }
}
let action = Trade100.Buy
print("this action is \(action)")



//定义一个账号管理协议
protocol AccountCompatible {
  var remainingFunds: Int { get }
  mutating func addFunds(amount: Int) throws
  mutating func removeFunds(amount: Int) throws
}

enum Account {
  case Empty
  case Funds(remaining: Int)
  enum Error{
    case Overdraft(amount: Int)
  }
  var remainingFunds: Int {
    switch self {
    case .Empty: return 0
    case .Funds(let remaining): return remaining
    }
  }
}

extension Account: AccountCompatible {
  mutating func addFunds(amount: Int) throws {
    var newAmount = amount
    if case let .Funds(remaining) = self {
      newAmount += remaining
    }
    if newAmount < 0 {
      //throw Error.Overdraft(amount: -newAmount)
    } else if newAmount == 0 {
      self = .Empty
    } else {
      self = .Funds(remaining: newAmount)
    }
  }
  mutating func removeFunds(amount: Int) throws {
      try self.addFunds(amount: amount * -1)
  }
}
var account = Account.Funds(remaining: 20)
print("add: ", try? account.addFunds(amount: 10))
print ("remove 1: ", try? account.removeFunds(amount: 15))
print ("remove 2: ", try? account.removeFunds(amount: 55))
// prints:
// : add:  Optional(())
// : remove 1:  Optional(())
// : remove 2:  nil



enum Entities {
    case Soldier(x: Int, y: Int)
    case Tank(x: Int, y: Int)
    case Player(x: Int, y: Int)
}

//枚举扩展方法
extension Entities {
   mutating func move(dist: CGVector) {}
   mutating func attack() {}
}

extension Entities: CustomStringConvertible {
  var description: String {
    switch self {
       case let .Soldier(x, y): return "\(x), \(y)"
       case let .Tank(x, y): return "\(x), \(y)"
       case let .Player(x, y): return "\(x), \(y)"
    }
  }
}



//枚举递归
enum FileNode {
  case File(name: String)
  indirect case Folder(name: String, files: [FileNode])
}



//枚举递归（定义一个二叉树）
indirect enum Tree<Element: Comparable> {
    case Empty
    case Node(Tree<Element>,Element,Tree<Element>)
}



//使用自定义类型作为枚举的值
enum Devices: CGSize {
    case iPhone3GS = "{320, 480}"
    case iPhone5 = "{320, 568}"
    case iPhone6 = "{375, 667}"
    case iPhone6Plus = "{414, 736}"
}

extension CGSize: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        let size = NSCoder.cgSize(for: value)
    self.init(width: size.width, height: size.height)
    }
    public init(extendedGraphemeClusterLiteral value: String) {
        let size = NSCoder.cgSize(for: value)
    self.init(width: size.width, height: size.height)
    }
    public init(unicodeScalarLiteral value: String) {
        let size = NSCoder.cgSize(for: value)
    self.init(width: size.width, height: size.height)
    }
}

let a = Devices.iPhone5
let b = a.rawValue
print("the phone size string is \(a), width is \(b.width), height is \(b.height)")
// prints : the phone size string is iPhone5, width is 320.0, height is 568.0



//一旦我们为枚举增加了关联值，Swift 就没有办法正确地为两个枚举进行相等性判断，需要我们自己实现 == 运行符
enum Trade88 {
    case Buy(stock: String, amount: Int)
    case Sell(stock: String, amount: Int)
}
func ==(lhs: Trade88, rhs: Trade88) -> Bool {
   switch (lhs, rhs) {
     case let (.Buy(stock1, amount1), .Buy(stock2, amount2))
       where stock1 == stock2 && amount1 == amount2:
       return true
     case let (.Sell(stock1, amount1), .Sell(stock2, amount2))
       where stock1 == stock2 && amount1 == amount2:
       return true
     default: return false
   }
}



//枚举自定义可失败构造方法
enum Device88 {
    case AppleWatch
    init?(term: String) {
      if term == "iWatch" {
      self = .AppleWatch
      }
      return nil
    }
}


//枚举自定义普通构造方法
enum NumberCategory {
   case Small
   case Medium
   case Big
   case Huge
   init(number n: Int) {
    if n < 10000 { self = .Small }
    else if n < 1000000 { self = .Medium }
    else if n < 100000000 { self = .Big }
    else { self = .Huge }
   }
}
let aNumber = NumberCategory(number: 100)
print(aNumber)
// prints: "Small"




enum APIError : Error {
    // Can't connect to the server (maybe offline?)
    case ConnectionError(error: NSError)
    // The server responded with a non 200 status code
    case ServerError(statusCode: Int, error: NSError)
    // We got no data (0 bytes) back from the server
    case NoDataError
    // The server response can't be converted from JSON to a Dictionary
    case JSONSerializationError(error: Error)
    // The Argo decoding Failed
    case JSONMappingError(converstionError: Error)
}



//didset中使用观察者模式
//enum Change {
//     case Insertion(items: [Item])
//     case Deletion(items: [Item])
//     case Update(items: [Item])
//}
//

//枚举表示http请求状态码
enum HttpError: String {
  case Code400 = "Bad Request"
  case Code401 = "Unauthorized"
  case Code402 = "Payment Required"
  case Code403 = "Forbidden"
  case Code404 = "Not Found"
}



//枚举json 映射
enum JSON {
    case JSONString(Swift.String)
    case JSONNumber(Double)
    case JSONObject([String : String])
    case JSONArray([String])
    case JSONBool(Bool)
    case JSONNull
}


//枚举标识cell属性
enum CellType: String {
    case ButtonValueCell = "ButtonValueCell"
    case UnitEditCell = "UnitEditCell"
    case LabelCell = "LabelCell"
    case ResultLabelCell = "ResultLabelCell"
}



//枚举表示单位转换
enum Liquid: Float {
  case ml = 1.0
  case l = 1000.0
    func convert(amount: Float, to: Liquid) -> Float {
      if self.rawValue < to.rawValue {
     return (self.rawValue / to.rawValue) * amount
      } else {
     return (self.rawValue * to.rawValue) * amount
      }
  }
}
// Convert liters to milliliters
print (Liquid.l.convert(amount: 5, to: Liquid.ml))



//游戏场景大量使用枚举
enum FlyingBeast { case Dragon, Hippogriff, Gargoyle }
enum Horde { case Ork, Troll }
enum Player { case Mage, Warrior, Barbarian }
enum NPC { case Vendor, Blacksmith }
enum Element { case Tree, Fence, Stone }
protocol Hurtable {}
protocol Killable {}
protocol Flying {}
protocol Attacking {}
protocol Obstacle {}
extension FlyingBeast: Hurtable, Killable, Flying, Attacking {}
extension Horde: Hurtable, Killable, Attacking {}
extension Player: Hurtable, Obstacle {}
extension NPC: Hurtable {}
extension Element: Obstacle {}



//枚举标识图片名
enum DetailViewImages: String {
  case Background = "bg1.png"
  case Sidebar = "sbg.png"
  case ActionButton1 = "btn1_1.png"
  case ActionButton2 = "btn2_1.png"
}


//枚举标识api路径
enum Instagram {
  enum Media {
    case Popular
    case Shortcode(id: String)
    case Search(lat: Float, min_timestamp: Int, lng: Float, max_timestamp: Int, distance: Int)
  }
  enum Users {
    case User(id: String)
    case Feed
    case Recent(id: String)
  }
}






