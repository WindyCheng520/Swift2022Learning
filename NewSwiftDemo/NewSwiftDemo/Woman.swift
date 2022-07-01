//
//  Woman.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import UIKit

//便利构造函数 开发中很少用
class Woman: NSObject {
    
    var name: String?
    var age: Int = 0
    
    //重载构造函数
    /***
     1.便利构造函数允许返回 nil
       --正常构造函数一定会创建对象
       --判断给定的参数是否符合条件,如果不符合条件,直接返回nil,不会创建对象,减少内存开销
     2.***只有***便利构造函数使用 'self.init()' 构造当前对象
       -- 没有convenience 关键字的构造函数是负责创建对象的,反之用来检查条件,本身不负责对象的创建
     3.如果要在便利构造函数中使用,当前对象的属性,一定要在 self.init() 之后
   ***/
    convenience init?(name: String, age: Int) {
        
        if age > 100 {
            return nil;
        }
        
        //使用self 访问 name之前,应该调先用 self.init()
        //实例化当前对象
        self.init()
        
        //执行到此, self 才允许被访问, 才能够访问到对象的属性
        self.name = name
        
    }

}
