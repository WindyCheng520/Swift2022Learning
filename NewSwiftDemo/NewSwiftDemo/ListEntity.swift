//
//  ListEntity.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/1.
//

import Foundation

/**
 1.定义模型属性的时候,如果是对象, 通常都是可选的
 ---在需要的时候创建
 ---避免写构造函数,可以简化代码
 2.如果是基本数据类型,不能设置成可选的,而且要设置初始值,否侧KVC 会崩溃!
 3.如果需要使用 KVC 设置数值,属性不能是 private的,否则会崩溃!!!!
 4.使用KVC 方法之前,应该调用super.init(),保证对象实例化完成!
 **/
///
@objcMembers  //(所有属性暴露给OC调用
class ListEntity:NSObject {

    
    /// 序号
   //基本数据类型在OC中没有可选,如果定义成可选,使用运行时同样获取不到,使用KVC 会崩溃!!!
   // var age: Int?
    var order: Int = 0
    
    /// 内容
    //private 的属性, 使用运行时,同样获取不到该属性(可以获取到ivar),同样会使 KVC 崩溃! (不要声明为 private)
   //  private var title: String?
    var content: String?
    
    //重载构造函数,使用字典为本类设置初始值
    init(dict: [String: Any]) {
        
        //保证对象已经完全初始化
        super.init()   //可选属性可以先调父类
        
        
        //使用self 的方法 'setValuesForKeys' 之前应该先调用 super.init()
        //KVC 是OC 的方法 ***运行时给对象发送消息***
        //先决条件是: 要求对象已经实例化完成!
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        //子类属性
        
        
        
        
        super.setValue(value, forKey: key)
    }
    
    
    //重写父类的方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
        //没有调用父类的方法,将父类的代码完全覆盖!不会崩溃(用于解决字典keys 多于 属性数
        
    }
    
    override var description:String {
        let keys = ["order", "content" ]
        return dictionaryWithValues(forKeys: keys).description
        
    }
}
