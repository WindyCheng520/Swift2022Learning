//
//  Shakeable.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/14.
//

import Foundation
import UIKit
 

//在协议扩展中添加默认实现
protocol Shakeable { }
// 你可以只为 UIView 添加 shake 方法！
extension Shakeable where Self: UIView {
    
    // shake 方法的默认实现
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint:CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}


//
//class FoodImageView: UIImageView, Shakeable {
//    // 其他自定义写在这儿
//}
// 
//class ActionButton: UIButton, Shakeable {
//    // 其他自定义写在这儿
//}
