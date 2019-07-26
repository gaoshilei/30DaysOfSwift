//
//  gradientCell.swift
//  Day 10 - TableView Gradient
//
//  Created by gaoshilei on 2019/7/26.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class gradientCell: UITableViewCell {
    
    let gradientLayer = CAGradientLayer()


    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setGradientColor(topColor:UIColor,bottomColor:UIColor) {
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.contentView.bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        self.contentView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    public func setTitle(title:String) {
        titleLabel.text = title
    }
}
