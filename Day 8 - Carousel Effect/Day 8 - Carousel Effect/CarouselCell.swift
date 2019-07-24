//
//  CarouselCell.swift
//  Day 8 - Carousel Effect
//
//  Created by gaoshilei on 2019/7/24.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    public var imageName:String? {
        didSet {
            if imageName != nil{
                coverImageView.image = UIImage(named: imageName!)
            }
        }
    }
    public var descString:String? {
        didSet {
            descLabel.text = descString
        }
    }
    var coverImageView:UIImageView!
    var descLabel:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpSubviews() {
        self.contentView.layer.cornerRadius = 12
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = .red
        
        coverImageView = UIImageView()
        coverImageView.contentMode = .scaleAspectFill
        self.contentView.addSubview(coverImageView)
        
        coverImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
        
        let labelBgView = UIView()
        self.contentView.addSubview(labelBgView)
        labelBgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(coverImageView)
            make.bottom.equalTo(self.contentView)
            make.height.equalTo(75)
        }
        
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        labelBgView.addSubview(effectView)
        effectView.snp.makeConstraints { (make) in
            make.edges.equalTo(labelBgView)
        }
        
        descLabel = UILabel()
        descLabel.font = UIFont.systemFont(ofSize: 18)
        descLabel.textColor = .white
        labelBgView.addSubview(descLabel)
        descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(labelBgView).offset(15)
            make.right.equalTo(labelBgView).offset(-15).priority(.low)
            make.centerY.equalTo(labelBgView)
        }
    }
}
