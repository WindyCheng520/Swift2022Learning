//
//  RxSwiftTableViewController2.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/15.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class RxSwiftTableViewController2: UIViewController {
    
    var tableView:UITableView!
        
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

       // 方式一：使用自带的Section
        //创建表格视图
              self.tableView = UITableView(frame: self.view.frame, style:.plain)
              //创建一个重用的单元格
              self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
              self.view.addSubview(self.tableView!)
               
              //初始化数据
              let items = Observable.just([
                  SectionModel(model: "", items: [
                      "UILable的用法",
                      "UIText的用法",
                      "UIButton的用法"
                      ])
                  ])
               
              //创建数据源
              let dataSource = RxTableViewSectionedReloadDataSource
                  <SectionModel<String, String>>(configureCell: {
                      (dataSource, tv, indexPath, element) in
                      let cell = tv.dequeueReusableCell(withIdentifier: "Cell")!
                      cell.textLabel?.text = "\(indexPath.row)：\(element)"
                      return cell
                  })
               
              //绑定单元格数据
              items
                  .bind(to: tableView.rx.items(dataSource: dataSource))
                  .disposed(by: disposeBag)
          }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


