//
//  LazyLoadingViewController.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import UIKit

class LazyLoadingViewController: UIViewController {
    
    //初始化label,并且分配空间,会提前创建控件
    //移动端开发, 延迟加载, 减少内存消耗
    //懒加载--lazy
    /***
        1.能够延迟创建
        2.最大的好处-->解除解包的烦恼
    ***/
    lazy var label: DemoLabel = DemoLabel() //懒加载简单实现
   // 懒加载本质上是一个闭包
   //懒加载完整写法: 供参考,开发中少用原因: 1.闭包中的智能提示不好.
   //                                 2.闭包中如果出现self.还需要注意循环引用.
    /**
       {} 包装代码
       () 执行代码
    */
/***    lazy var label = {() ->DemoLabel in
        let l = DemoLabel()
        //设置label 的属性
        return l
    }()
***/
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
