import UIKit

//Singleton 单例模式
//单例就像一个公司的IT部门，他们是唯一的存在，并且被所有人直接访问。

//官方定义
//
//保证一个类仅有一个实例，并提供一个访问它的全局访问点。
//
//因为第二点常常被忽视，所以过度使用的危害极大，你无从知道调用从何而来，这种goto一般的存在会变成维护的噩梦。
//
//单例比较常见的应用是例如数据库，网络框架的全局访问点。
//
//单例其实就是变种的原型模式，只不过原型每次返回的是一个拷贝。


//写法1
class Singleton {
    static let shared = Singleton()
    private init() {
        // 用private防止被new
    }
}
let s  = Singleton.shared
//let s2 = Singleton() // ERROR: initializer is inaccessible due to 'private' protection level



//写法2
public final class Singleton1 {
    private static let _shared = Singleton1()
    private init() { }
    public static var shared: Singleton1 {
        print("side effects here")
      //  connect() // 举个栗子
        return _shared
    }
}

let s1  = Singleton1.shared

