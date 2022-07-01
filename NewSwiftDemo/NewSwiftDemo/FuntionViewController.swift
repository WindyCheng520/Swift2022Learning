//
//  FuntionViewController.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import UIKit

class FuntionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(sum(x: 10, y: 80))
        print(sum1(num1: 1000, num2: 29999))
        print(sum2(555, 111))
        LogHello()
        //测试默认值
        print(sum3())
        print(sum3(x: 10, y: 20))
        print(sum3(x: 10))
        print(sum3(y: 20))
        
        
        //无返回值3种样式
        demo1()
        demo2()
        demo3()
    }
    
    
    
    /// 函数定义,格式 函数名(形参列表) ->返回值类型
    func sum(x:Int, y:Int) -> Int {
        return x + y
    }
    /// MARK:- 外部参数
    /// - 外部参数 就是在形参前 加一个名字
    /// - 外部参数不会影响函数内部细节
    /// - 外部参数会让外部调用方法看起来更加直观
    func sum1(num1 x:Int, num2 y:Int) -> Int {
        return x + y
    }
    
    func sum2(_ x:Int, _ y:Int) -> Int {
        //在swift中 _就是可以忽略任意不感兴趣的内容
        return x + y
    }

    func LogHello() {
         //在swift中 _就是可以忽略任意不感兴趣的内容
        for _ in 0...10 {
            print("hello world")
        }
    }
    // MARK:- 函数默认值
    // 通过给参数设定默认值,在调用的时候,可以任意组合参数,若不指定则调用默认值
    // OC中需要定义很多方法,以及方法实现
    func sum3(x:Int = 2, y:Int = 3) -> Int {
        return x + y
    }
    
    // MARK:- 无返回值 多种样式(写法),主要用在闭包
    // 1.省略
    // 2.->()
    // 3.->Void
    func demo1() {
        print("呵呵")
    }
    
    func demo2() ->() {
        print("嘿嘿")
    }
    
    func demo3() ->Void{
        print("哈哈哈")
    }
    

}
