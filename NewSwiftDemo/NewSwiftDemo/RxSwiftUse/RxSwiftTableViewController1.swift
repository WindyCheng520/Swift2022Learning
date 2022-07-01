//
//  RxSwiftTableViewController1.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/15.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftTableViewController1: UIViewController {
    
    var tableView:UITableView!
    var showMessage = ""
        
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建表格视图
        tableView = UITableView(frame: view.frame, style:.plain)
        //创建一个重用的单元格
       tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView!)
        
        //初始化数据
        let items = Observable.just([
            "文本输入框的用法",
            "开关按钮的用法",
            "进度条的用法",
            "文本标签的用法",
        ])
        
        //设置单元格数据（其实就是对 cellForRowAt 的封装）
        items.bind(to: tableView.rx.items) { (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "\(row)：\(element)"
                return cell
            }.disposed(by: disposeBag)
        
        
        
        //获取选中项的索引
        tableView.rx.itemSelected.subscribe(onNext: { indexPath in
            print("选中项的indexPath为：\(indexPath)")
        }).disposed(by: disposeBag)
         
        //获取选中项的内容
        tableView.rx.modelSelected(String.self).subscribe(onNext: { item in
            print("选中项的标题为：\(item)")
        }).disposed(by: disposeBag)
        
        
//        //（3）或者也可以在响应中调用外部的方法：
//        //获取选中项的索引
//        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
//            self?.showMessage("选中项的indexPath为：\(indexPath)")
//        }).disposed(by: disposeBag)
//
//        //获取选中项的内容
//        tableView.rx.modelSelected(String.self).subscribe(onNext: {[weak self] item in
//            self?.showMessage("选中项的标题为：\(item)")
//        }).disposed(by: disposeBag)
        
       // 当然同时获取选中项的索引及内容也是可以的：
        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(String.self))
            .bind { [weak self] indexPath, item in
                self?.showMessage = ("选中项的indexPath为：\(indexPath)")
                self?.showMessage = ("选中项的标题为：\(item)")
                
                print("-----选中项的indexPath为：\(indexPath)")
                print("-----选中项的标题为：\(item)")
            }
            .disposed(by: disposeBag)
        
        
        
        
    
        //获取被取消选中项的索引
        tableView.rx.itemDeselected.subscribe(onNext: { [weak self] indexPath in
            print("被取消选中项的indexPath为：\(indexPath)")
        }).disposed(by: disposeBag)
         
        //获取被取消选中项的内容
        tableView.rx.modelDeselected(String.self).subscribe(onNext: {[weak self] item in
            print("被取消选中项的的标题为：\(item)")
        }).disposed(by: disposeBag)
        
        
        
        
       // （2）也可以同时获取：
        Observable.zip(tableView.rx.itemDeselected, tableView.rx.modelDeselected(String.self))
            .bind { [weak self] indexPath, item in
                print("----被取消选中项的indexPath为：\(indexPath)")
                print("----被取消选中项的的标题为：\(item)")
            }
            .disposed(by: disposeBag)
        
        
        
        
        
        //获取删除项的索引
        tableView.rx.itemDeleted.subscribe(onNext: { [weak self] indexPath in
            print("删除项的indexPath为：\(indexPath)")
        }).disposed(by: disposeBag)
         
        //获取删除项的内容
        tableView.rx.modelDeleted(String.self).subscribe(onNext: {[weak self] item in
            print("删除项的的标题为：\(item)")
        }).disposed(by: disposeBag)
        
        
        
        //获取移动项的索引
        tableView.rx.itemMoved.subscribe(onNext: { [weak self]
            sourceIndexPath, destinationIndexPath in
            print("移动项原来的indexPath为：\(sourceIndexPath)")
            print("移动项现在的indexPath为：\(destinationIndexPath)")
        }).disposed(by: disposeBag)
        
        
        
        //获取插入项的索引
        tableView.rx.itemInserted.subscribe(onNext: { [weak self] indexPath in
            print("插入项的indexPath为：\(indexPath)")
        }).disposed(by: disposeBag)
        
        
        
        //获取点击的尾部图标的索引
        tableView.rx.itemAccessoryButtonTapped.subscribe(onNext: { [weak self] indexPath in
            print("尾部项的indexPath为：\(indexPath)")
        }).disposed(by: disposeBag)
        
        
        
        //单元格将要显示出来的事件响应
        tableView.rx.willDisplayCell.subscribe(onNext: { cell, indexPath in
            print("将要显示单元格indexPath为：\(indexPath)")
            print("将要显示单元格cell为：\(cell)\n")
             
        }).disposed(by: disposeBag)
        
        
        
        
        
        
    }
    
    

}
