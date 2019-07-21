//
//  VideoCell.swift
//  Day 5 - Play Local Video
//
//  Created by gaoshilei on 2019/7/21.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

struct VideoInfo {
    let image: String
    let duration: String
    let name: String
}

class VideoCell: UITableViewCell {
    @IBOutlet weak  var titleLabel: UILabel!
    @IBOutlet weak  var timeLabel: UILabel!
    @IBOutlet weak  var coverImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
