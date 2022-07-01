//
//  People.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import UIKit

/***
 1.给自己的属性分配空间并且设置初始化
 2.调用父类的的 '构造函数',并给父类的属性分配空间设置初始值
 (根OC 的顺序相反, 由子及父)
 ***/

class People: NSObject {
    
    var name:String //必选属性
    
    //重写 ->父类有这个方法,子类重新实现, 需要 override 关键字
    //
    override init() {
        
        print("Person init")
        //所有的初始值都一样
        name = "小明"
        
        super.init()
    }
    
    //重载, 函数名相同,但参数和个数不同(现代语言必备特性)
    //重载可以给自己的属性从外部设置初始值(OC 没有重载, initWithXXXXX)
    //重载方法很少用/写(开发中使用第三方库)
    init(name :String) {  //很少用,有第三方库
        
        //使用参数的 name 设置给属性
        self.name = name
        
        //调用父类的构造函数
        super.init()
    }

}
