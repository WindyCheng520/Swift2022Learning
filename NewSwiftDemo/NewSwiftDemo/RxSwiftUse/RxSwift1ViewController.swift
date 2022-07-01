//
//  RxSwift1ViewController.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/15.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwift1ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //歌曲列表数据源
       let musicListViewModel = MusicListViewModel()
        
       //负责对象销毁
       let disposeBag = DisposeBag()
    
//    
//    代码的简单说明：
//    DisposeBag：作用是 Rx 在视图控制器或者其持有者将要销毁的时候，自动释法掉绑定在它上面的资源。它是通过类似“订阅处置机制”方式实现（类似于 NotificationCenter 的 removeObserver）。
//    rx.items(cellIdentifier:）:这是 Rx 基于 cellForRowAt 数据源方法的一个封装。传统方式中我们还要有个 numberOfRowsInSection 方法，使用 Rx 后就不再需要了（Rx 已经帮我们完成了相关工作）。
//    rx.modelSelected： 这是 Rx 基于 UITableView 委托回调方法 didSelectRowAt 的一个封装。
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "musicCell")

        //将数据源数据绑定到tableView上
            musicListViewModel.data
                .bind(to: tableView.rx.items(cellIdentifier:"musicCell")) { _, music, cell in
                    cell.textLabel?.text = music.name
                    cell.detailTextLabel?.text = music.singer
                }.disposed(by: disposeBag)
             
            //tableView点击响应
            tableView.rx.modelSelected(Music.self).subscribe(onNext: { music in
                print("你选中的歌曲信息【\(music)】")
            }).disposed(by: disposeBag)
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


