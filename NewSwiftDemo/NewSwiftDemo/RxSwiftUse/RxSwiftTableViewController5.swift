//
//  RxSwiftTableViewController5.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/15.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

//自定义Section
struct MySection1 {
    var header: String
    var items: [Item]
}
 
extension MySection1 : AnimatableSectionModelType {
    typealias Item = String
     
    var identity: String {
        return header
    }
     
    init(original: MySection1, items: [Item]) {
        self = original
        self.items = items
    }
}




class RxSwiftTableViewController5: UIViewController {
    
    var tableView:UITableView!
       
      let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        //创建表格视图
         self.tableView = UITableView(frame: self.view.frame, style:.plain)
         //创建一个重用的单元格
         self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
         self.view.addSubview(self.tableView!)
          
         //初始化数据
         let sections = Observable.just([
             MySection1(header: "基本控件", items: [
                 "UILable的用法",
                 "UIText的用法",
                 "UIButton的用法"
                 ]),
             MySection1(header: "高级控件", items: [
                 "UITableView的用法",
                 "UICollectionViews的用法"
                 ])
             ])
          
         //创建数据源
         let dataSource = RxTableViewSectionedAnimatedDataSource<MySection1>(
             //设置单元格
             configureCell: { ds, tv, ip, item in
                 let cell = tv.dequeueReusableCell(withIdentifier: "Cell")
                     ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
                 cell.textLabel?.text = "\(ip.row)：\(item)"
                  
                 return cell
             },
             //设置分区头标题
             titleForHeaderInSection: { ds, index in
                 return ds.sectionModels[index].header
             }
         )
          
         //绑定单元格数据
         sections
             .bind(to: tableView.rx.items(dataSource: dataSource))
             .disposed(by: disposeBag)
     }
    }
    
