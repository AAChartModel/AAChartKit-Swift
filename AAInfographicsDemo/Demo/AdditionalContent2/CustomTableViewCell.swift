//
//  CustomTableViewCell.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2022/9/30.
//  Copyright © 2022 An An. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        numberLabel.layer.cornerRadius = 10
        numberLabel.layer.masksToBounds = true
        
        updateColors()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // 更新颜色以支持夜间模式
    func updateColors() {
        if #available(iOS 13.0, *) {
            backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            contentView.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            titleLabel.textColor = UIColor.label
        } else {
            // Fallback on earlier versions
        }
        numberLabel.textColor = UIColor.white
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        // 当用户界面样式发生变化时重新更新颜色
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                updateColors()
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
