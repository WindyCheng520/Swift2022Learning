//
//  DemoLabel.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import UIKit

class DemoLabel: UILabel {
    
    
    //重写构造函数
    //Xib 不会调用,出代码专用
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutUI()
    }
    //initWithCoder-->是使用Xib 和 StoryBoard 开发的入口
    //所有UIView 及子类 开发时一重写了构造函数
    //必须实现 initWithCoder 函数,以保证 提供两个通道
    //方法的添加 Xcode 有智能提示
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        //fatalError("init?(coder aDecoder:")
        
        //fatalError: 使用Xib 开发,会直接崩溃
        //禁止 Xib / SB 使用本类
        layoutUI()
        
     // fatalError("init?(coder aDecoder:) has no been implement")
    }
    
     private func layoutUI() {
        
        print("设置界面")
        
    }
}
