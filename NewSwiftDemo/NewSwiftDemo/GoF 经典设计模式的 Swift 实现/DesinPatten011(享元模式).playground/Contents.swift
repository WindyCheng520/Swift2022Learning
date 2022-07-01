import UIKit

//Flyweight 享元模式
//享元模式就像CPU的Cache Memory，它通过对缓存的命中来实现速度的提升和内存的降低。

//官方定义
//
//运用共享技术有效地支持大量细粒度的对象。
//
//享元模式其实就是指一套缓存系统。
//显然他是一种复合模式，使用工厂模式来创造实例。
//适用场景是系统中存在重复的对象创建过程。
//好处是节省了内存加快了速度。


struct TargetObject {
    var title: String?
    func printTitle() {
        print(title)
    }
}

class Cache {
    var targetObjects = [String: TargetObject]()
    func lookup(key: String) -> TargetObject {
        if targetObjects.index(forKey: key) == nil {
            return TargetObject()
        }
        return targetObjects[key]!
    }
}

let c = Cache()
c.targetObjects["Test"] = TargetObject(title: "Test")
c.lookup(key: "123").printTitle() // nil
c.lookup(key: "Test").printTitle() // Test





//demo2
import Foundation

//假设有一家杂货店，一开始老板不知道卖什么，有人来买，马上就制造，进货后就会不会缺货，我们就可以使用享元模式，将有人买过的东西保存起来共享，再有人买直接拿出来就可以，不用再去进新的货。

//商品
struct Commodity: CustomStringConvertible {//CustomStringConvertible该协议能够使自定义输出实例的description
    var commodity: String
    var description: String {
        get {
            return "商品名称："+commodity
        }
    }
}

//杂货店
class GroceryStore {
//商品列表
    private var list = [String: Commodity]()
//mutating关键字作用：在方法中修改struct和enum变量，如果不加，会提示无法修改结构体成员
    func buyCommodity(name: String) -> Commodity {
//无货，制造，制造好后，放到list中共享
        if !list.keys.contains(name) {
            print("没有这个货，给你制造！")
            list[name] = Commodity(commodity: name)
        }else {
            print("有货，直接给你拿！")
        }
        return list[name]!
    }
}


let shop = GroceryStore()
let commodity1 = shop.buyCommodity(name: "电视")//没有电视，会去创建新的对象
print(commodity1)
/*
没有这个货，给你制造！
商品名称：电视
*/
let commodity2 = shop.buyCommodity(name: "电视")//已经有电视了，去共享的list中取
print(commodity2)
/*
有货，直接给你拿！
商品名称：电视
*/
