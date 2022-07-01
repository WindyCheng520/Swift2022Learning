//
//  RxSwiftTableViewController6.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/15.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class RxSwiftTableViewController6: UIViewController {
    
    //刷新按钮
     var refreshButton: UIBarButtonItem!
    //停止按钮
    var cancelButton: UIBarButtonItem!
       
      //表格
      var tableView:UITableView!
       
      let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton.init(title: "刷新", color: .yellow, bgColor: .blue)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 64)
    //    button.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        button.tag = 100
        
        refreshButton =  UIBarButtonItem.init(customView: button)
        
        
        
        let button1 = UIButton.init(title: "取消", color: .yellow, bgColor: .red)
        button1.frame = CGRect(x: 0, y: 0, width: 60, height: 64)
       // button1.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        button1.tag = 101
        cancelButton =  UIBarButtonItem.init(customView: button1)
        
        self.navigationItem.rightBarButtonItems = [refreshButton, cancelButton]
        

        //创建表格视图
          self.tableView = UITableView(frame: self.view.frame, style:.plain)
          //创建一个重用的单元格
          self.tableView!.register(UITableViewCell.self,
                                   forCellReuseIdentifier: "Cell")
          self.view.addSubview(self.tableView!)
           
          //随机的表格数据
          let randomResult = refreshButton.rx.tap.asObservable()
              .startWith(()) //加这个为了让一开始就能自动请求一次数据
              .flatMapLatest{
                  self.getRandomResult().take(until: self.cancelButton.rx.tap)
              }
              .share(replay: 1)
           
          //创建数据源
          let dataSource = RxTableViewSectionedReloadDataSource
              <SectionModel<String, Int>>(configureCell: {
                  (dataSource, tv, indexPath, element) in
                  let cell = tv.dequeueReusableCell(withIdentifier: "Cell")!
                  cell.textLabel?.text = "条目\(indexPath.row)：\(element)"
                  return cell
              })
           
          //绑定单元格数据
          randomResult
              .bind(to: tableView.rx.items(dataSource: dataSource))
              .disposed(by: disposeBag)
      }
       
      //获取随机数据
      func getRandomResult() -> Observable<[SectionModel<String, Int>]> {
          print("正在请求数据......")
          let items = (0 ..< 5).map {_ in
              Int(arc4random())
          }
          let observable = Observable.just([SectionModel(model: "S", items: items)])
          return observable.delay(.seconds(2), scheduler: MainScheduler.instance)
      }
    }
    
