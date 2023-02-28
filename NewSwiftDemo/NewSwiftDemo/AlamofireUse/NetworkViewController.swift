//
//  NetworkViewController.swift
//  NewSwiftDemo
//
//  Created by Windy on 2023/1/1.
//

import UIKit

//https://blog.csdn.net/YouAreUmbrella/article/details/128046042?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-128046042-blog-105914862.pc_relevant_3mothn_strategy_recovery&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-128046042-blog-105914862.pc_relevant_3mothn_strategy_recovery&utm_relevant_index=2
class NetworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let target = NetworkAPI.login(mobile: "12345789", verifyCode: "6666")
        NetworkManager<LoginModel>().request(target){ [weak self] (result) in
            guard let self = self else { return }
            if let loginModel = result.data {
                print("登录成功！")
                let userMessage = "token: \(loginModel.token)" + "\n\nid: \(loginModel.user.id)" + "\n\nmobile: \(loginModel.user.mobile)"
               print(userMessage)
            } else {
                //失败
                print(result.info)
            }
            
        }
      
    }
}
