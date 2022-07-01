//: Playground - noun: a place where people can play

import UIKit

class UI{
    
    enum Theme{
        case DayMode
        case NightMode
    }
    
    var fontColor: UIColor!
    var backgroundColor: UIColor!
    var themeMode: Theme = .DayMode{
        didSet{
            //self.changeTheme(self.themeMode)           //swift 2
            self.changeTheme(themeMode: self.themeMode)  //swift 3
        }
    }
    
    init(){
        self.themeMode = .DayMode
        //self.changeTheme(self.themeMode)           //swift 2
        self.changeTheme(themeMode: self.themeMode)  //swift 3
        
    }
    
    init(themeMode: Theme){
        self.themeMode = themeMode
        //self.changeTheme(self.themeMode)           //swift 2
        self.changeTheme(themeMode: self.themeMode)  //swift 3
    }
    
    func changeTheme( themeMode: Theme ){
        switch(themeMode){
        case .DayMode:
            //fontColor = UIColor.blackColor()        //swift 2
            //swift3中，颜色从“xxxColor()”变成了"xxx"。直接调用UIColor.xxx即可
            fontColor = UIColor.black                 //swift 3
            //backgroundColor = UIColor.whiteColor()  //swift 2
            backgroundColor = UIColor.white           //swift 3
        case .NightMode:
            //fontColor = UIColor.whiteColor()        //swift 2
            fontColor = UIColor.white                 //swift 3
            //backgroundColor = UIColor.blackColor()  //swift 2
            backgroundColor = UIColor.black           //swift 3
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


// 以前就见过Nest Type
// String.Index
let str = "Hello World"
//let index = str.startIndex.advancedBy(5)          //swift 2
let index = str.index(str.startIndex, offsetBy: 5)  //swift 3
//str.substringToIndex(index)           //swift 2
str[..<index]
