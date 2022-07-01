//
//  UIStackViewController.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/14.
//

import UIKit

class UIStackViewController: UIViewController {
    
    var stackView:UIStackView!
    var nestedStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        stackView.translatesAutoresizingMaskIntoConstraints = false
          self.view.addSubview(stackView)
          // Main UIStackView contraints, nearly fills its parent view
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[stackView]-30-|",options: NSLayoutConstraint.FormatOptions.alignAllLeading,metrics: nil, views: ["stackView":stackView] ))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[stackView]-10-|",options: NSLayoutConstraint.FormatOptions.alignAllLeading,metrics: nil, views: ["stackView":stackView]))

        stackView.axis = .vertical
        stackView.alignment = .fill
          stackView.spacing = 25
        stackView.distribution = .fillEqually

          var lbl = UILabel()
        lbl.text = "Label 1"
        lbl.backgroundColor = UIColor.red
          stackView.addArrangedSubview(lbl)

          lbl = UILabel()
          lbl.text = "Label 2"
        lbl.backgroundColor = UIColor.green
          stackView.addArrangedSubview(lbl)

        nestedStackView.axis = .horizontal
        nestedStackView.alignment = .fill
          nestedStackView.spacing = 25
        nestedStackView.distribution = .fillEqually
        nestedStackView.addArrangedSubview(UIButton(type: .infoDark))
        nestedStackView.addArrangedSubview(UIButton(type: .infoLight))
        nestedStackView.addArrangedSubview(UIButton(type: .contactAdd))
          stackView.addArrangedSubview(nestedStackView)

        let btn = UIButton(type: .system)
        btn.setTitle("Press Me", for: .normal)
          stackView.addArrangedSubview(btn)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
