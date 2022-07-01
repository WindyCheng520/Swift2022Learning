//
//  Person.swift
//  swift 3.0 运行时加载属性
//
//  Created by Windy on 16/10/5.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

/***
 1.给自己的属性分配空间并且设置初始化
 2.调用父类的的 '构造函数',并给父类的属性分配空间设置初始值
 (根OC 的顺序相反, 由子及父)
 ***/

class Person: NSObject {
    
    var name: String?
    
    //基本数据类型在OC中没有可选,如果定义成可选,使用运行时同样获取不到,使用KVC 会崩溃!!!
   // var age: Int?
    var age: Int = 0
    
    //private 的属性, 使用运行时,同样获取不到该属性(可以获取到ivar),同样会使 KVC 崩溃!
    var title: String?
    
    //class func 类似于OC 中的加方法 (静态方法)
    ///目标: (使用运行时)获取当前类所有属性的数组
    /// 获取 ivar 列表是所有第三方字典转模型的基础
    class func propertyList() ->[String]{
        
        var count: UInt32 = 0
        
        //1.获取'类' 的属性列表,返回属性列表的数组,可选类型
      let list = class_copyPropertyList(self, &count)
      print("属性的数量 -----\(count)")
        
        /*
        //2.便利数组
        for i in 0..<Int(count){
            
            //3.根据下标获取属性
            //objc_property_t?
            let pty = list?[i]
            
            //4.获取属性的名称的 C语言的字符串
            //Int8 -> Byte -> Char => C语言的字符串
            let cName = property_getName(pty!)
            print(cName)
            
            //5.转换成String的字符串
            let name = String(utf8String: cName!)
            print(name)
        }
       */
        
        
//        //2.便利数组
//        for i in 0..<Int(count){
//            
//            //3.根据下标获取属性
//            //objc_property_t?
//            //使用guard 语法, 依次判断每一项是否有值,只要有一项为nil,就不再执行后续代码!
//            guard let pty = list?[i],
//                  let cName:UnsafeMutablePointer = property_getName(pty),
//                let name = String(utf8String: cName)
//                else{
//                    //继续遍历下一个
//                    continue
//            }
//            //name一定有值(用 guard let 的好处)
//            print(name)
//        }

        //6. 释放C语言的对象
        free(list)
        return []
    }
}
