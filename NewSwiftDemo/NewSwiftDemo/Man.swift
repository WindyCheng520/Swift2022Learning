//
//  Man.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import UIKit

class Man: NSObject {
    
    
    //getter & setter 仅供演示,日常开发不用!!!
    private var _name: String?
    //swift中 一般不会重写 getter 和setter 方法
    var name: String?{
        get{
            return _name
        }
        
        set{
            _name = newValue
        }
    }
    
    //OC中定义属性的时候,有一个 readonly -> 重写get 方法
    var title: String?{
        //只重写了 getter方法, 没有重写 setter 方法
        //就是只读属性
        //又称为计算型属性-->本身不保存内容,都是通过计算获得结果
        get{
            return "Mr. " + (name ?? "")
        }
    }
    
    //只读属性的简写---直接return(省略get)
    var title2: String?{
        
        return "Mr.XXXXXXX " + (name ?? "")
    }


}
