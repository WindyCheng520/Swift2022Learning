//
//  MoyaUseViewController.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/27.
//

import UIKit

class MoyaUseViewController: UIViewController {
    
    // MARK: - 1.interface
    
    // MARK: - 2.lift cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get 文本数据请求
//        HJNet.request(target: HJApi.randomVerse) { code, result in
//            print(result)
//        } failureBlock: { code, msg in
//            print(msg)
//        }
        
        //post 数据请求
        let parameters = [
            "key": "765eae9d033fcad3202b3732a33b76e7",
            "type": "top",
            "page": "1",
            "page_size": "5",
            "is_filter": "1",
        ]
        //使用的公开的聚合数据，但是拿不到正确数据，只拿到了错误数据，但是逻辑是没问题的，后续我在进行修改吧
        HJNet.request(target: HJApi.new(parameters),
                      modelType: HJModel.self) { code, model in
            print(model?.pageSize ?? "")
        } failureBlock: { code, msg in
            print(msg)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - 3.private methods
    
    // MARK: - 4.event response
    
    // MARK: - 5.getter

}
