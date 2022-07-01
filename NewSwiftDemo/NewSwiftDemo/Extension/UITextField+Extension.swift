//
//  UITextField+Extension.swift
//  swift 3.0 加法计算器
//
//  Created by Windy on 16/10/5.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

//swift 分类
extension UITextField{
    
    convenience init(frame: CGRect, placeholder: String, fontSize: CGFloat = 14) {
        //实例化当前对象
        self.init(frame:frame)
        
        //访问属性
        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        self.font = UIFont.systemFont(ofSize: fontSize)
    }
    
}
