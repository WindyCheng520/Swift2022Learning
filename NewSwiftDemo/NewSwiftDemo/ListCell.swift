//
//  ListCell.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/1.
//

import UIKit
import SnapKit

class ListCell: UITableViewCell {
    
    lazy var itemLabel: UILabel = UILabel(title: "序号", fontSize: 15)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /// 构造
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    lazy var contentLabel: UILabel = UILabel(title: "内容", fontSize: 15)
    
    //模型 ->给视图设置模型，由视图自己根据模型的数据，决定显示内容
    var listEntity:ListEntity?{
        
        //替代 OC 中重写 setter 方法
        didSet{
            
            // 此时属性已有值，可以直接使用设置 UI
            if let listEntity = listEntity { //解包使用基本数据 0， 1 不然是个可选值
                itemLabel.text = "\(String(describing: listEntity.order))"
            }
            
            contentLabel.text = listEntity?.content
        }
    }
    
    
    
    //和OC 不同
    //一旦label设置为nil, 懒加载不会再次执行!   label = nil  再调用 print(label) 此时懒加载不会再执行
    //懒加载的代码只会在第一次调用的时候,执行闭包,然后将必报的结果保存 在 label 的属性中
    private lazy var label: UILabel? = UILabel()  //这个label 未用到
    //swift 中一定注意不要主动清理视图或控间
    //因为懒加载不会再次创建!!!!

}


extension ListCell {
    @objc func setupUI() {
        contentView.addSubview(itemLabel)
        contentView.addSubview(contentLabel)
        
        itemLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.right.equalToSuperview()
            make.width.equalTo(100)
            make.bottom.equalToSuperview()
        }
    }
}
