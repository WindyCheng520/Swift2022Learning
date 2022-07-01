//
//  RxSwiftTableViewController3.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/15.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources


//自定义Section
struct MySection {
    var header: String
    var items: [Item]
}
 
extension MySection : AnimatableSectionModelType {
    typealias Item = String
     
    var identity: String {
        return header
    }
     
    init(original: MySection, items: [Item]) {
        self = original
        self.items = items
    }
}


class RxSwiftTableViewController3: UIViewController {
    var tableView:UITableView!
      
     let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

       //方式二：使用自定义的Section
        //创建表格视图
          self.tableView = UITableView(frame: self.view.frame, style:.plain)
          //创建一个重用的单元格
          self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
          self.view.addSubview(self.tableView!)
           
          //初始化数据
          let sections = Observable.just([
              MySection(header: "", items: [
                  "UILable的用法",
                  "UIText的用法",
                  "UIButton的用法"
                  ])
              ])
           
          //创建数据源
          let dataSource = RxTableViewSectionedAnimatedDataSource<MySection>(
              //设置单元格
              configureCell: { ds, tv, ip, item in
                  let cell = tv.dequeueReusableCell(withIdentifier: "Cell")
                      ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
                  cell.textLabel?.text = "\(ip.row)：\(item)"
                   
                  return cell
          })
           
          //绑定单元格数据
          sections
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


