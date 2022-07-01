//: Playground - noun: a place where people can play

import UIKit

internal enum Theme{
    case DayMode
    case NightMode
}

internal class UI{
    
    private var fontColor: UIColor!
    private var backgroundColor: UIColor!
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
    
    private func changeTheme( themeMode: Theme ){
        switch(themeMode){
        case .DayMode:

            fontColor = UIColor.black                  //swift 3
            backgroundColor = UIColor.white            //swift 3
        case .NightMode:
         
            fontColor = UIColor.white                  //swift 3
            backgroundColor = UIColor.black            //swift 3
        }
    }
    
    func show(){
      
        print("The font color is \(fontColor == UIColor.white ? "WHITE" : "BLACK" )")     //swift 3
        
        print("The background color is \(backgroundColor == UIColor.white ? "WHITE" : "BLACK")")   // swift 3
    }
}





