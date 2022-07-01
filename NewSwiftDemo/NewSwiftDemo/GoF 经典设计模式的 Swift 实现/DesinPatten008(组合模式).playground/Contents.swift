import UIKit


//Composite 组合模式
//组合模式就像一个公司的组织架构，存在基层员工(Leaf)和管理者(Composite)，他们都实现了组件(Component)的work方法，这种树状结构的每一级都是一个功能完备的个体。


//官方定义
//
//将对象组合成树形结构以表示"部分-整体"的层次结构。组合模式使得用户对单个对象和组合对象的使用具有一致性。
//
//这个组合模式不是“组合优于继承”的那种“组合”，这里是狭义的指代一种特定场景，就是如配图描述的一种树状结构。
//
//理解这个模式要知道三个设定：
//
//Component：一个有功能性的组件。
//Leaf：它实现了组件。
//Composite：它既实现了组件，他又包含多个组件。


protocol Component {
    func someMethod()
}

class Leaf: Component {
    func someMethod() {
        // Leaf
    }
}

class Composite: Component {
    var components = [Component]()
    func someMethod() {
        // Composite
    }
}

let leaf = Leaf()
let composite = Composite()
composite.components += [leaf]

composite.someMethod()
leaf.someMethod()

//这个模式的精髓就是Composite这个角色，事实上Leaf可以看做一个特殊的Compostie。由于他即可以是一个功能执行者，又可以包含其它节点，这个特性可以派生出泛用度很高的树状结构。





//dmeo2
import Foundation

//画图案的协议
protocol DrawProtocol {
    func draw()
}

class Circle: DrawProtocol {
    func draw() {
        print("我负责画圆")
    }
}

class Square: DrawProtocol {
    func draw() {
        print("我负责画方形")
    }
}

class Triangle: DrawProtocol {
    func draw() {
        print("我负责画三角形")
    }
}

class Print: DrawProtocol {

    var drawer = [DrawProtocol]()

    func addDrawer(_ drawer: DrawProtocol...) {
        self.drawer.append(contentsOf: drawer)
    }

    func draw() {
        _ = drawer.map{$0.draw()}
    }
}

//单个对象可以单独使用draw函数，也可以组合到一起，使用组合后的draw
let a = Circle()
let b = Square()
let c = Triangle()
a.draw()//我负责画圆
b.draw()//我负责画方形
c.draw()//我负责画三角形
let p = Print()
p.addDrawer(a,b,c)
p.draw()
/*
我负责画圆
我负责画方形
我负责画三角形
*/
