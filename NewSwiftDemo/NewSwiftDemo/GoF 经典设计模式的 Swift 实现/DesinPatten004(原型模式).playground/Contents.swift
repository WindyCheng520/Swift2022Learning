import UIKit

//Prototype 原型模式
//原型模式让你有了一个可以源源不断自我赋值的类。

//官方定义
//
//用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。
//
//原型模式很简单，你只要实现一个返回你自己的新对象的方法即可。这里我采用的实现还不是最简单的，这个interface并不是必须的。
//
//原型模式实现了深拷贝。
protocol Prototype {
    func clone() -> Prototype
}

struct Product: Prototype {
    var title: String
    func clone() -> Prototype {
        return Product(title: title)
    }
}

let p1 = Product(title: "p1")
let p2 = p1.clone()
(p2 as? Product)?.title // OUTPUT: p1




//demo2
//定义了一个程序员原型，假设有一大群程序员，他们之间的区别就是姓名不同，其余都相同
class Programmer {

    var name: String?
    var age: Int
    var sex: String
    var language: String

    init(age: Int, sex: String, language: String) {
        self.language = language
        self.age = age
        self.sex = sex
    }

//可以克隆自己
    func clone() -> Programmer {
        return Programmer(age: age, sex: sex, language: language)
    }

}
//从打印结果可以得出，韩梅梅我们只要克隆李雷，然后修改他的名字就可以了，无需重新创建
let a = Programmer(age: 18, sex: "M", language: "swift")
a.name = "李雷"
print(dump(a))
/*
▿ Prototype.Programmer #0
▿ name: Optional("李雷")
- some: "李雷"
- age: 18
- sex: "M"
- language: "swift"
Prototype.Programmer
*/
let b = a.clone()
b.name = "韩梅梅"
print(dump(b))
/*
▿ Prototype.Programmer #0
▿ name: Optional("韩梅梅")
- some: "韩梅梅"
- age: 18
- sex: "M"
- language: "swift"
Prototype.Programmer
*/
