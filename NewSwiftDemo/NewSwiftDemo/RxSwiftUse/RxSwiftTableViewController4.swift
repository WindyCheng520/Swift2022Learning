//
//  RxSwiftTableViewController4.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/15.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class RxSwiftTableViewController4: UIViewController {
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
        let items = Observable.just([
            SectionModel(model: "基本控件", items: [
                "UILable的用法",
                "UIText的用法",
                "UIButton的用法"
                ]),
            SectionModel(model: "高级控件", items: [
                "UITableView的用法",
                "UICollectionViews的用法"
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
         
        //设置分区头标题
        dataSource.titleForHeaderInSection = { ds, index in
            return ds.sectionModels[index].model
        }
         
        //设置分区尾标题
        //dataSource.titleForFooterInSection = { ds, index in
        //    return "footer"
        //}
         
        //绑定单元格数据
        items
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}
    

