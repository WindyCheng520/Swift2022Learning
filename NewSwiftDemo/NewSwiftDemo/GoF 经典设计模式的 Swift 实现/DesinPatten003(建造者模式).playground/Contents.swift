import UIKit

//Builder 建造者模式
//建造者模式就像你委托一个室内设计师装修你的新家
//官方定义
//将一个复杂的构建与其表示相分离，使得同样的构建过程可以创建不同的表示。
//
//如果说之前的谈到的工厂模式是把创建产品(对象)的工作抽离出去的话，这次要聊的建造者模式，就是把产品内部的组件生产工作抽离出去。这样做的场景，适用于那些有着复杂、规则模块的对象生成流程。换句话说，工厂模式是一个类(工厂)创建另一个类(产品)，而建造者是一个类(产品)自身的属性(组件)构造过程。
//
//对于建造者模式的实现网上也是版本不一：复杂点的版本会引入一个Director的角色，做一个整体上下文，组装更傻瓜化的builder和product。或是抽象一层Builder协议，用不同的具体Builder来构造不同的产品。但我认为这些都模糊了这个模式要传达的焦点，对理解没有帮助，所以这里我选择一个极简的模型。

struct Builder {
    var partA: String
    var partB: String
}

struct Product {
    var partA: String
    var partB: String
    init(builder: Builder) {
        partA = builder.partA
        partB = builder.partB
    }
}

// 通过builder完成产品创建工作
let b = Builder(partA: "A", partB: "B")
// 这样产品只需要一个builder就可以完成制作
let p = Product(builder: b)
//我们让Product的生成由自己发起，但是它的组件(属性)全都委托给Builder来实现，而它只需要依赖一个Builder就完成了自身的生产工作。




//demo2

//创建对象需要的表示，需要用户自己定制
struct LabelBuilder {

    var text: String
    var color: UIColor
    var rect: CGRect
}


class LabelDirector {

//对象的构建，需要传入表示
    static func creatLableWithBuilder(builder: LabelBuilder) -> UILabel {

        let label = UILabel(frame: builder.rect)
        label.text = builder.text
        label.textColor = builder.color
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }
}

//let builder = LabelBuilder(text: "按钮", color: .orange, rect: CGRect(x: 100, y: 100, width: view.frame.width-200, height: 30))
////通过自定义标签的表示，用同一个构造方法构建标签
//let label = LabelDirector.creatLableWithBuilder(builder: builder)
//view.addSubview(label)
