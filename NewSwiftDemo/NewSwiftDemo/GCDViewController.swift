//
//  GCDViewController.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import UIKit

class GCDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData { (result) in
            print("获取的新闻数据\(result)")
        }
    }
    
    
    /**
     
      在异步执行任务,获取结果,通过闭包/block 回调
      闭包的应用场景和 block 完全 一致
    */
    func loadData(completion: @escaping (_ result:[String]) ->()) -> () {
        //将任务添加到队列,指定执行任务的函数
        //翻译:队列调度任务(block/闭包, 以同步/ 异步 的方式执行
        DispatchQueue.global().async {
            print("耗时操作\(Thread.current)")
            
            //休眠
            Thread.sleep(forTimeInterval: 1.0)
            
            //获得结果
            let json = ["头条", "八卦", "出大事了"]
            DispatchQueue.main.async{
                print("主线程更新UI\(Thread.current)")
                completion(json)
            }
        }
    }

    


}
