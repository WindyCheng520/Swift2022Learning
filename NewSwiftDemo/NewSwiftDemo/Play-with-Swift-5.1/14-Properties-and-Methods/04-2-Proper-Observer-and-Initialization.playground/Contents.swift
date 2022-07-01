//: Playground - noun: a place where people can play

import UIKit

// 注意，didSet和willSet不会在初始化阶段调用的。
// 因此，didSet和willSet对常量let没有意义，因为let只在初始化阶段赋值

enum Theme : CaseIterable{
    case DayMode
    case NightMode
}

class UI{
    
    var fontColor: UIColor!
    var backgroundColor: UIColor!
    var themeMode: Theme = .DayMode{
        
        didSet{
            switch(themeMode){
            case .DayMode:
                fontColor = UIColor.black                  //swift 3
                backgroundColor = .white            //swift 3
            case .NightMode:
                fontColor = .white                  //swift 3
                backgroundColor = UIColor.black            //swift 3
            }
        }
    }
    
    init(){
        self.themeMode = .DayMode
        // 需要初始化其他变量
        fontColor = UIColor.black                  //swift 3
        backgroundColor = UIColor.white            //swift 3
    }
    
    init(themeMode: Theme){
        self.themeMode = themeMode
        switch(themeMode){
        case .DayMode:
            fontColor = UIColor.black                  //swift 3
            backgroundColor = .white            //swift 3
        case .NightMode:
            fontColor = .white                  //swift 3
            backgroundColor = UIColor.black            //swift 3
        }
    }
}


let ui = UI()
ui.themeMode
ui.fontColor
ui.backgroundColor

ui.themeMode = .NightMode
ui.fontColor
ui.backgroundColor
