//
//  UIColor+Extension.swift
//  Weibo
//
//  Created by 狗身狗面狗 on 2022/5/3.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat, alpha : CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    
    class func randomColor() -> UIColor{
        let r = CGFloat(arc4random() % 256) / 255.0
        let g = CGFloat(arc4random() % 256) / 255.0
        let b = CGFloat(arc4random() % 256) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    
    
    convenience init(hex string: String) {
        var hex = string.hasPrefix("#")
            ? String(string.dropFirst())
            : string
        
        guard hex.count == 3 || hex.count == 6
            else {
                self.init(white: 1.0, alpha: 0.0)
                return
        }
        
        if hex.count == 3 {
            for (index, char) in hex.enumerated() {
                //hex.insert(char, at: hex.startIndex.advancedBy(index * 2))
                hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
            }
        }
        
        self.init(
            red:   CGFloat((Int(hex, radix: 16)! >> 16) & 0xFF) / 255.0,
            green: CGFloat((Int(hex, radix: 16)! >> 8) & 0xFF) / 255.0,
            blue:  CGFloat((Int(hex, radix: 16)!) & 0xFF) / 255.0, alpha: 1.0)
    }
    
    /// 用十六进制颜色创建UIColor
    ///
    /// - Parameter hexColor: 十六进制颜色 (0F0F0F)
    @objc convenience init(hexColor: String) {
        
        // 存储转换后的数值
        var red:UInt64 = 0, green:UInt64 = 0, blue:UInt64 = 0
        
        // 分别转换进行转换
        Scanner(string: hexColor[0..<2]).scanHexInt64(&red)
        
        Scanner(string: hexColor[2..<4]).scanHexInt64(&green)
        
        Scanner(string: hexColor[4..<6]).scanHexInt64(&blue)
        
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
    
}


extension String {
    
    /// String使用下标截取字符串
    /// 例: "示例字符串"[0..<2] 结果是 "示例"
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
}
