//
//  RxSwiftTableViewController9.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/15.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources



class RxSwiftTableViewController9: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       let   image1 = UIImage(named: "network_ic_password")
       let   image2 = UIImage(named: "network_ic_wifi")
       let   image3 = UIImage(named: "ico_sys_qs_44")
        
        guard let image11 = image1,  let image22 = image2, let image33 = image3 else{
            return
        }

        //初始化数据
          let sections = Observable.just([
              MySection2(header: "我是第一个分区", items: [
                  .TitleImageSectionItem(title: "图片数据1", image: image11),
                  .TitleImageSectionItem(title: "图片数据2", image: image22),
                  .TitleSwitchSectionItem(title: "开关数据1", enabled: true)
                  ]),
              MySection2(header: "我是第二个分区", items: [
                  .TitleSwitchSectionItem(title: "开关数据2", enabled: false),
                  .TitleSwitchSectionItem(title: "开关数据3", enabled: false),
                  .TitleImageSectionItem(title: "图片数据3", image: image33)
                  ])
              ])
           
          //创建数据源
          let dataSource = RxTableViewSectionedReloadDataSource<MySection2>(
              //设置单元格
              configureCell: { dataSource, tableView, indexPath, item in
                  switch dataSource[indexPath] {
                  case let .TitleImageSectionItem(title, image):
                      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1",
                                                               for: indexPath)
                      (cell.viewWithTag(1) as! UILabel).text = title
                      (cell.viewWithTag(2) as! UIImageView).image = image
                      return cell
                       
                  case let .TitleSwitchSectionItem(title, enabled):
                      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2",
                                                               for: indexPath)
                      (cell.viewWithTag(1) as! UILabel).text = title
                      (cell.viewWithTag(2) as! UISwitch).isOn = enabled
                      return cell
                  }
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


//单元格类型
enum SectionItem {
    case TitleImageSectionItem(title: String, image: UIImage)
    case TitleSwitchSectionItem(title: String, enabled: Bool)
}
 
//自定义Section
struct MySection2 {
    var header: String
    var items: [SectionItem]
}
 
extension MySection2 : SectionModelType {
    typealias Item = SectionItem
     
    init(original: MySection2, items: [Item]) {
        self = original
        self.items = items
    }
}
