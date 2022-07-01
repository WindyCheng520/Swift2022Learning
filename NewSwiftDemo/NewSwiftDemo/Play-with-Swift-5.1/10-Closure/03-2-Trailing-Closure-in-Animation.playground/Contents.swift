//: Playground - noun: a place where people can play

import UIKit
import XCPlayground


let showView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

let rectangle = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
rectangle.center = showView.center


// swift3中，颜色从“xxxColor()”变成了"xxx"。直接调用UIColor.xxx即可

rectangle.backgroundColor = .red   //swift 3

showView.addSubview(rectangle)


// swift 3中animateWithDuration的API发生了变动，变成了animate(withDuration: )，语义更加明确
// swift 3环境下的报错：'animateWithDuration(_:animations:)' has been renamed to 'animate(withDuration:animations:)'

UIView.animate(withDuration: 2.0){         //swift 3
    //rectangle.backgroundColor = UIColor.blueColor()   //swift 2
    rectangle.backgroundColor = UIColor.blue            //swift 3
    rectangle.frame = showView.frame
}

// 这个方法在swift4中还能用，但是语法已经过时了。swift下一个版本有可能彻底地将语法改变
// 报错（警告）：'liveView' is deprecated: Use 'PlaygroundPage.current.liveView' from the 'PlaygroundSupport' module instead

import PlaygroundSupport   //要想移除这个报错，要引入这个文件。然后，将'XCPlaygroundPage.currentPage.liveView'改成'PlaygroundPage.current.liveView'

PlaygroundPage.current.liveView = showView    //swift 4
