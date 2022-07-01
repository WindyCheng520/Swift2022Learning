//
//  DemoTableViewCell.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/2.
//

import Foundation
import UIKit

protocol DemoCellDelegate: NSObjectProtocol {
    func cellTapSwitch(_ content: String , _ status: Bool)
}

class DemoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    // false:白色  true:黑色
    var status: Bool = false
    
    var content: String = "" {
        didSet {
            titleLabel.text = content
            if content == "黑色" {
                titleLabel.textColor = .red
                button.isHidden = true
            } else {
                titleLabel.textColor = .black
                button.isHidden = false
            }
            if status {
                button.setTitle("删除域名", for: .normal)
                button.setTitleColor(.red, for: .normal)
            } else {
                button.setTitle("切换域名", for: .normal)
                button.setTitleColor(.systemBlue, for: .normal)
            }
        }
    }
    weak var delegate: DemoCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func ClickAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        print("点击cell-----------------------------")
        self.delegate?.cellTapSwitch(content, status)
    }
    
    
}
