//读访问
var name = "jaki"
//写访问
print(name)

//var stepSize = 1
//
//func increment(_ number: inout Int) {
//    number += stepSize//crash
//}
//
//increment(&stepSize)
//var stepSize = 1
//
//func increment(_ number: inout Int,_ number2: inout Int) {
//    var a = number+number2
//}
//
//increment(&stepSize,&stepSize)
//struct Player {
//    var name: String
//    var health: Int
//    var energy: Int
//
//    let maxHealth = 10
//    mutating func shareHealth(_ player:inout Player) {
//        health = player.health
//    }
//}
//var play = Player(name: "jaki", health: 10, energy: 10)
//play.shareHealth(&play)//产生错误
class Demo {
    var playerInformation = (health: 10, energy: 20)
    func balance(_ p1 :inout Int,_ p2 :inout Int) {
        
    }
    func test()  {
        self.balance(&playerInformation.health, &playerInformation.energy)//crash
    }
}
let demo = Demo()
demo.test()
