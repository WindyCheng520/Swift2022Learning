//
//  BreakRecycleViewController.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import UIKit

class BreakRecycleViewController: UIViewController {
    
    //属性
    var completionCallBack:(() ->())?

    override func viewDidLoad() {
        super.viewDidLoad()

        //****解除循环引用,需要打断链条
      //方法1:OC的方式
        //weak可能会被在运行时修改->指向的对象一旦被释放,会自动被置为 nil
    //    weak var weakSelf = self
    //    loadData {
            //解包
            //解包方式1: ? 可选解包-如果self 已经被释放,不会向对象发送getter 方法,更加安全
            //解包方式2: ! 强行解包- 如果self 已经被释放,强行解包会导致崩溃
            /****
                weakSelf?.view--只是单纯地发送消息,没有计算
                强行解包,因为需要计算,可选项不能直接参与计算
            ****/
      //      print(weakSelf?.view)
         //   print(self.view) //循环应用 演示
     //   }
        
        //方法2:- swift 推荐方法
        //[weak self] 表示{}中所有的 self 都是弱引用,注意解包
        loadData {[weak self] in
            print(self?.view ?? "")
        }
        
        
        //方法3:- swift
        //[unowned self] 表示{}中所有的 self 都是assign,不会强引用,但是如果对想释放,指针地址不会变化
        //如果对象被释放,继续调用,就会出现野指针的问题
      //  loadData {[unowned self] in
      //     print(self.view) //
      //   }
    }
    
    func loadData(completion:@escaping () ->()) -> () {
        completionCallBack =  completion
        
        //异步
        DispatchQueue.global().async {
            print("耗时操作")
            
            DispatchQueue.main.async {
                //回调,执行闭包
                completion()
            }
        }
    }
    
    //类似于OC 的 dealloc
    //没有 func --> 不让调用
    //没有 () --> 不让重载
    //在对象被销毁前自动调用
    deinit {   //析构函数,在对象被销毁前自动调用
        print("死了")
        //1.跟踪对象的销毁
        //2.必须释放的
        /**
          -通知,不释放不会崩溃,但是会泄露
          -KVO, 不释放会崩溃
          -NSTimer/ CADisplayLink
        **/
    }

}
