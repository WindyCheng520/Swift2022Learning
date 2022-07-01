//: ----
//:  - [小波说雨燕 3天学会Swift 3](http://www.xiaoboswift.com)
//:  - 全集课件：[github.com/yagamis](http://github.com/yagamis/swift2basic)
//: ----
//: - 属性是一个类/结构体/枚举关联的变量.
//: - 实例属性: 实例化后才能使用。
//: ----
//:  - 存储属性: 保存单个类型的变量.
class 角色 {
    var id = ""
    var money = 0
}

let xiaobo = 角色()

xiaobo.id = "小波"
xiaobo.money = 5000

//:  - 计算属性: 由其他属性计算得出的. 由getter和setter组成.
//:  - getter⏳获取器(必须):描述属性如何计算及返回语句,形式: get { 语句和返回 }
//:  - setter🔨设置器(可选):有新值(newValue)后如何影响其他属性.形式: set { 语句 }.
//:  - 🌰游戏角色的当前坐标，通常是移动方式代表的位移量相关.
struct 坐标 {
    var x = 0, y = 0
}
enum 移动方式 {
    case 走
    case 跑
    case 骑
    case 传送
}

class 法师: 角色 {
    var 人物坐标 = 坐标()
    var 人物移动方式 = 移动方式.走
    
    var 当前坐标: 坐标 {
        get {
            switch 人物移动方式 {
            case .走:
                人物坐标.x += 1
                人物坐标.y += 1
            case .跑:
                人物坐标.x += 3
                人物坐标.y += 3
            case .骑:
                人物坐标.x += 10
                人物坐标.y += 10
            case .传送:
                人物坐标.x += 1000
                人物坐标.y += 1000
            }  
            return 人物坐标
        }
        
        set {
            人物坐标 = newValue
        }
    }
}

var 法师1 = 法师()

法师1.当前坐标
法师1.人物移动方式 = .跑

法师1.当前坐标

法师1.人物移动方式 = .传送

法师1.当前坐标

//计算属性的setter方法，影响其他属性
法师1.当前坐标 = 坐标(x: 2000, y: 90)
法师1.人物坐标


//:  - 👀属性监视器: 对属性值的变化进行响应.
//:  - willSet: 事前响应. 新值 newValue
//:  - didSet : 事后响应. 旧值 oldValue
class 经验 {
    var 总经验 = 0 {
        willSet {
            print("当前总经验是:\(newValue)!")
        }
        didSet {
            print("增加了\(总经验 - oldValue)点经验!")
        }
    }
}

var 经验1 = 经验()
经验1.总经验 = 1000
经验1.总经验 = 3000
经验1.总经验 = 8000
//: ----
//:



//:  [>](@next)
