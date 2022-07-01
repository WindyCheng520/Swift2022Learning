//
//  RxSwiftTableViewController10.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/15.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources


//有时我们可能需要调整 tableView 单元格的高度、或者修改 section 头尾视图样式等等。虽然 RxSwift 没有封装相关的方法，但我们仍然可以通过相关的代理方法来设置。
//原文出自：www.hangge.com  转载请保留原文链接：https://www.hangge.com/blog/cache/detail_1984.html

class RxSwiftTableViewController10: UIViewController, UIScrollViewDelegate {
    
    
    var tableView:UITableView!
        
       var dataSource:RxTableViewSectionedAnimatedDataSource<MySection5>?
        
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
                  MySection5(header: "基本控件", items: [
                      "UILable的用法",
                      "UIText的用法",
                      "UIButton的用法"
                      ]),
                  MySection5(header: "高级控件", items: [
                      "UITableView的用法",
                      "UICollectionViews的用法"
                      ])
                  ])
               
              //创建数据源
              let dataSource = RxTableViewSectionedAnimatedDataSource<MySection5>(
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
               
              self.dataSource = dataSource
               
              //绑定单元格数据
              sections
                  .bind(to: tableView.rx.items(dataSource: dataSource))
                  .disposed(by: disposeBag)
               
              //设置代理
              tableView.rx.setDelegate(self)
                  .disposed(by: disposeBag)
          }
    }
    


//tableView代理实现
extension RxSwiftTableViewController10 : UITableViewDelegate {
    //设置单元格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)
        -> CGFloat {
        guard let _ = dataSource?[indexPath],
            let _ = dataSource?[indexPath.section]
            else {
                return 0.0
        }
     
        return 60
    }
    
    
    
    //返回分区头部视图
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int)
           -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.black
           let titleLabel = UILabel()
           titleLabel.text = self.dataSource?[section].header
           titleLabel.textColor = UIColor.white
           titleLabel.sizeToFit()
           titleLabel.center = CGPoint(x: self.view.frame.width/2, y: 20)
           headerView.addSubview(titleLabel)
           return headerView
       }
        
       //返回分区头部高度
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int)
           -> CGFloat {
           return 40
       }
    
}



//自定义Section
struct MySection5 {
    var header: String
    var items: [Item]
}
 
extension MySection5 : AnimatableSectionModelType {
    typealias Item = String
     
    var identity: String {
        return header
    }
     
    init(original: MySection5, items: [Item]) {
        self = original
        self.items = items
    }
}
