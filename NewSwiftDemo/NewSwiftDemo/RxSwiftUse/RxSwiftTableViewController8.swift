//
//  RxSwiftTableViewController8.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/15.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources




class RxSwiftTableViewController8: UIViewController {
    
    //刷新按钮
     var refreshButton: UIBarButtonItem!
      
     //新增按钮
    var addButton: UIBarButtonItem!
      
     //表格
     var tableView:UITableView!
      
     let disposeBag = DisposeBag()
      

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button = UIButton.init(title: "刷新", color: .yellow, bgColor: .blue)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
    //    button.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        button.tag = 100
        
        refreshButton =  UIBarButtonItem.init(customView: button)
        
        
        
        let button1 = UIButton.init(title: "添加", color: .yellow, bgColor: .red)
        button1.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
       // button1.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        button1.tag = 101
        addButton =  UIBarButtonItem.init(customView: button1)
        
        self.navigationItem.rightBarButtonItems = [refreshButton,addButton]
        
        
        

        //创建表格视图
          self.tableView = UITableView(frame: self.view.frame, style:.plain)
          //创建一个重用的单元格
          self.tableView!.register(UITableViewCell.self,
                                   forCellReuseIdentifier: "Cell")
          self.view.addSubview(self.tableView!)
           
          //表格模型
          let initialVM = TableViewModel()
           
          //刷新数据命令
          let refreshCommand = refreshButton.rx.tap.asObservable()
              .startWith(()) //加这个为了页面初始化时会自动加载一次数据
              .flatMapLatest(getRandomResult)
              .map(TableEditingCommand.setItems)
           
          //新增条目命令
          let addCommand = addButton.rx.tap.asObservable()
              .map{ "\(arc4random())" }
              .map(TableEditingCommand.addItem)
           
          //移动位置命令
          let movedCommand = tableView.rx.itemMoved
              .map(TableEditingCommand.moveItem)
           
          //删除条目命令
          let deleteCommand = tableView.rx.itemDeleted.asObservable()
              .map(TableEditingCommand.deleteItem)
           
          //绑定单元格数据
          Observable.of(refreshCommand, addCommand, movedCommand, deleteCommand)
              .merge()
              .scan(initialVM) { (vm: TableViewModel, command: TableEditingCommand)
                  -> TableViewModel in
                  return vm.execute(command: command)
              }
              .startWith(initialVM)
              .map {
                  [AnimatableSectionModel(model: "", items: $0.items)]
              }
              .share(replay: 1)
              .bind(to: tableView.rx.items(dataSource: ViewController.dataSource()))
              .disposed(by: disposeBag)
      }
       
      override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          tableView.setEditing(true, animated: true)
      }
       
      //获取随机数据
      func getRandomResult() -> Observable<[String]> {
          print("生成随机数据。")
          let items = (0 ..< 5).map {_ in
              "\(arc4random())"
          }
          return Observable.just(items)
      }
    }


extension ViewController {
    //创建表格数据源
    static func dataSource() -> RxTableViewSectionedAnimatedDataSource
        <AnimatableSectionModel<String, String>> {
        return RxTableViewSectionedAnimatedDataSource(
            //设置插入、删除、移动单元格的动画效果
            animationConfiguration: AnimationConfiguration(insertAnimation: .top,
                                                           reloadAnimation: .fade,
                                                           deleteAnimation: .left),
            configureCell: {
                (dataSource, tv, indexPath, element) in
                let cell = tv.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "条目\(indexPath.row)：\(element)"
                return cell
        },
            canEditRowAtIndexPath: { _, _ in
                return true //单元格可删除
        },
            canMoveRowAtIndexPath: { _, _ in
                return true //单元格可移动
        }
        )
    }
}
    

