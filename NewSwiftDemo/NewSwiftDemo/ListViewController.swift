//
//  ListViewController.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/1.
//

import UIKit


private let kCellHeight : CGFloat = 80

private let kCellID = "kCellID"

class ListViewController: UIViewController {
    
    private lazy var dataSource = [ListEntity]() //声明数据源数组
    
    // MARK: 懒加载属性
    fileprivate lazy var myButton: UIButton = UIButton()
    
    // MARK:- 懒加载属性(闭包的方式）
    fileprivate lazy var tableView : UITableView = {[weak self] in
        let frame = CGRect(x: 0, y:0, width: kScreenW, height: kScreenH)
        let tableView = UITableView.init(frame: frame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListCell.self, forCellReuseIdentifier: kCellID)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        
        let p = Woman(name: "老王", age: 30)
        print(p?.name)
        
        
       //URL的构造函数可以返回 nil
        //构造函数就是实例化对象的
        //init?(sting: Stirng) ->构造函数可以返回nil
        let url = URL(string: "https://www.baidu.com")
        
        //发起网络请求
        //-和OC 的区别,闭包的所有参数,需要自己写,OC 是直接带入
        //-如果不关心的值,可以直接 '_'忽略
        
        URLSession.shared.dataTask(with: url!) { (data, _, error) in
            
            guard let data = data else {
                print("网络请求失败 \(error)")
                return
            }
            
            //将data 转换为String
            let html = String(data: data, encoding:.utf8)
            print(html)
        }.resume()
        
        
        
        
        

        let button = UIButton.init(title: "关闭", color: .yellow, bgColor: .blue)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 64)
        button.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        button.tag = 100
        
        let barButtonItem1 =  UIBarButtonItem.init(customView: button)
        
        
        
        let button1 = UIButton.init(title: "网格", color: .yellow, bgColor: .blue)
        button1.frame = CGRect(x: 0, y: 0, width: 60, height: 64)
        button1.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        button1.tag = 101
        let barButtonItem2 =  UIBarButtonItem.init(customView: button1)
        
        self.navigationItem.rightBarButtonItems = [barButtonItem1, barButtonItem2]
        
        self.setupUI()
        
        
       let listEntity1 = ListEntity(dict: ["order": 1, "content" : "TableViewController"])
       let listEntity2 = ListEntity(dict: ["order": 2, "content" : "RxSwiftTableView0"])
        
        let listEntity3 = ListEntity(dict: ["order": 3, "content" : "RxSwiftTableViewController1"])
        let listEntity4 = ListEntity(dict: ["order":4, "content" : "RxSwiftTableViewController2"])
        let listEntity5 = ListEntity(dict: ["order": 5, "content" : "RxSwiftTableViewController3"])
        
        let listEntity6 = ListEntity(dict: ["order":6, "content" : "RxSwiftTableViewController4"])
        let listEntity7 = ListEntity(dict: ["order":7, "content" : "RxSwiftTableViewController5"])
        let listEntity8 = ListEntity(dict: ["order":8, "content" : "RxSwiftTableViewController6"])
        let listEntity9 = ListEntity(dict: ["order":9, "content" : "RxSwiftTableViewController7"])
        let listEntity10 = ListEntity(dict: ["order":10, "content" : "RxSwiftTableViewController8"])
        let listEntity11 = ListEntity(dict: ["order":11, "content" : "RxSwiftTableViewController9"])
        let listEntity12 = ListEntity(dict: ["order":12, "content" : "RxSwiftTableViewController10"])
        
        
        
       

        dataSource.append(listEntity1)
        dataSource.append(listEntity2)
        dataSource.append(listEntity3)
        dataSource.append(listEntity4)
        dataSource.append(listEntity5)
        
        dataSource.append(listEntity6)
        dataSource.append(listEntity7)
        dataSource.append(listEntity8)
        dataSource.append(listEntity9)
        
        dataSource.append(listEntity10)
        dataSource.append(listEntity11)
        dataSource.append(listEntity12)
    }
    
    @objc func click(_ sender: UIButton){
        
        if (sender.tag == 100){
            
           // sefl.dismiss()  默认值
            self.dismiss(animated: true, completion: nil)
        }else{
            let dest = CollectionViewController()
            self.navigationController?.pushViewController(dest, animated: true)
        }
    }
    
    
    @IBAction func gridAction(_ sender: UIButton) {
        
        
    }
    

}

// MARK:- 设置UI界面
extension ListViewController {
      func setupUI() {
        // 1.添加UICollectionView
        view.addSubview(tableView)
        
    }
}

// MARK:- 设置UI界面
private typealias TableViewDelegate = ListViewController
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kCellHeight
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        debugPrint(indexPath.row)
        
        print(GlobalConfig.tips)
        
        if (indexPath.row == 0){
            let dest = TableViewController()  //xib 加载cell
            self.navigationController?.pushViewController(dest, animated: true)
        }else if (indexPath.row == 1){
            let dest = RxSwift1ViewController()
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }else if (indexPath.row == 2){
            let dest = RxSwiftTableViewController1()
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }else if (indexPath.row == 3){
            let dest = RxSwiftTableViewController2()
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }else if (indexPath.row == 4){
            let dest = RxSwiftTableViewController3()
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }else if (indexPath.row == 5){
            let dest = RxSwiftTableViewController4()
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }else if (indexPath.row == 6){
            let dest = RxSwiftTableViewController5()
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }else if (indexPath.row == 7){
            let dest = RxSwiftTableViewController6()
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }else if (indexPath.row == 8){
            let dest = RxSwiftTableViewController7()
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }else if (indexPath.row == 9){
            let dest = RxSwiftTableViewController8()
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }else if (indexPath.row == 10){
          //  let dest = RxSwiftTableViewController9()
            
         
            
            
            let sb = UIStoryboard(name:"RxSwift",bundle: Bundle.main)
            let vc = sb.instantiateViewController(withIdentifier: "RxSwift")
         //   let nav =  sb.instantiateViewController(withIdentifier: "RxSwift1")
            
//            let nav = UINavigationController(rootViewController: vc)
//            nav.modalPresentationStyle = .fullScreen
//            self.present(nav, animated: true, completion: nil)
//
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if (indexPath.row == 11){
            let dest = RxSwiftTableViewController10()
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }
    
        
            
    }
}




//如何为您的扩展取个好听的名字(别名）
private typealias TableViewDataSource = ListViewController
extension TableViewDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataSource.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        // 会调用行高方法
        let entity = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellID, for: indexPath) as! ListCell
        cell.listEntity = entity
        
        return cell
    }
}
