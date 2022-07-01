//: Playground - noun: a place where people can play

import UIKit


// 代码整理
enum Theme{
    case DayMode
    case NightMode
}

class UI{
    
    var fontColor: UIColor!
    var backgroundColor: UIColor!
    var themeMode: Theme = .DayMode{
        didSet{
            self.changeTheme(themeMode: themeMode)    //swift 3
        }
    }
    
    init(){
        self.themeMode = .DayMode
        self.changeTheme(themeMode: themeMode)    //swift 3
    
    }
    
    init(themeMode: Theme){
        self.themeMode = themeMode
        self.changeTheme(themeMode: themeMode)    //swift 3
    }
    
    func changeTheme( themeMode: Theme ){
        switch(themeMode){
        case .DayMode:
            fontColor = UIColor.black                  //swift 3
            backgroundColor = UIColor.white            //swift 3
        case .NightMode:
            fontColor = UIColor.white                  //swift 3
            backgroundColor = UIColor.black            //swift 3
        }
    }
}


let ui = UI()
ui.themeMode
ui.fontColor
ui.backgroundColor

ui.themeMode = .NightMode
ui.themeMode
ui.fontColor
ui.backgroundColor
