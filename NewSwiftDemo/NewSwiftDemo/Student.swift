//
//  Student.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import UIKit

class Student: People {
    
    var no :String //必选属性(父类没有，子类新增的属性）
    
    init(name: String, no: String) {
        self.no = no
        
        //调用父类方法, 给name 初始化
        super.init(name: name)
    }

}
