//
//  ViewController.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/1.
//

import UIKit


//Defer
//https://swift.gg/2016/12/01/defer-defer-defer/
//设置和清理工作成对出现的时候。
//前置或者后置增量操作的时候。
//应用“下个状态”更新。
//优化分组布局的代码

//让你的 Swift 代码更 Swift

//Swift 学习笔记
//https://blog.csdn.net/same_life?type=blog

/**
 在swift 中,默认同一个项目中(同一命名空间下),所有的类都是共享的,可以直接访问,不需要 import
 所有对象的属性 var, 也可以直接访问到
 **/

class ViewController: UIViewController {
    
   lazy var yellowView: UIView = {
        $0.backgroundColor = .yellow
        return $0
     // 确保下一行的括号内要传入 UIView()
    }(UIView())
    
    
//    //引入Then 这个库可以这样写
//   lazy var label = UILabel().then {
//        $0.textAlignment = .Center
//        $0.textColor = .blackColor()
//        $0.text = "Hello, World!"
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
#warning("this is incomplete")
        let key = "isUserLoggedIn"

        UserDefaults.standard.set(true, forKey: key)
        UserDefaults.standard.synchronize()
        UserDefaults.standard.value(forKey: key)
        
//        if let string = string.flatMap({ $0 as? NSString }) {
//            myFunction(string)
//        }

//        
//        guard let thing = thing else { return } // 在变量不能被解包的时候退出
//        doSomething(with: thing) // thing 这个变量现在已经解包了
        
        //Swift 中对应一个函数 init()构造函数
        //作用:给成员变量分配空间,初始化成员变量
       // let person = Person(name:"老王八")
       // print(person.name)
        let student = Student(name: "张三", no: "010")
        
        print(student.name + "-------" + student.no)

        
//        print("**********************************")
//        print(Person.propertyList())
//        print("**********************************")
        
        let button = UIButton.init(title: "列表", color: .yellow, bgColor: .blue)
        
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        button.center = view.center
        
        view.addSubview(button)
        
        
//        //将文本框内容转换为数值
//        //?如果文本框内容不是数字Int 之后是 nil
//        guard let num1 = Int(numText1?.text ?? ""), let num2 = Int(numText2?.text ?? "") else {
//            return
//        }
//        
//        //处理结果
//        resultLabel?.text = "\(num1 + num2)"
        
        
    }
    
    @objc func click(){
        
        print(#function)
        
        
        
        let dest = ListViewController()
        
        let navVC = UINavigationController.init(rootViewController: dest)
        
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
  
    }

}

