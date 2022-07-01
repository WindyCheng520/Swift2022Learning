//
//  AppDelegate.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/1.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    //** 注意window 是可选的（Xcode 自动声明的都是可选的）
    var window: UIWindow?
    
    /**
       1.swift 中有命名空间
         - 同一命名空间下，全局共享！
         - 第三方框架 使用 swift 如果直接拖拽到项目中，同属一个命名空间，很有可能会冲突
       2.- swift 中 NSClassFromString(反射机制）的写法
         - 反射最重要的目的就是为了解耦！
         - 搜索 ‘反射机制和工厂方法’
         - 封装的很好，而且弹性很大！
    */

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //*** 代码中的 ？ 都是可选解包，发送消息，不参与计算
        //所有的？ 都是 Xcode 自动添加的！
        
        //1.实例化 window
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        //--- 输出 Bundle info.plist 的内容
        //[String : AnyObject]?
        print(Bundle.main.infoDictionary ?? "")
        
        
        //2.设置跟控制器,需要添加命名空间 -> 默认就是 项目名称（最好不要有数数字和特殊符号）！！！！！！！！！！！！！！
        //let className = "NewSwiftDemo.ViewController"
        //AnyClass? -> 视图控制器类型（OC反射机制再swift中的使用）
        
        
        //***解包***
        //1> 因为字典是可选的，因此需要解包再取值
        //   如果字典 为 nil， 就不取值
        //2> 通过key 从字典中取值，如果 key 错了，就没有值了
        //   AnyObject? 表示不一定能够获取到值
        
        guard let info = Bundle.main.infoDictionary,
              let projectName = info["CFBundleExecutable"] as? String else { return false}
        let nameSpace = projectName.replacingOccurrences(of: "-", with: "_")
        
        let className = "ViewController"
        
        let anyClass: AnyClass? = NSClassFromString("\(nameSpace).\(className)")
        
        guard let typeClass = anyClass as? UIViewController.Type else { return  false}
        
        
        //使用类创建视图控制器
        //UIViewController?
        //let vc = typeClass.init()
        
        let vc = typeClass.init()
        
        window?.rootViewController = vc
        //让 windower 可见
        
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle



}

