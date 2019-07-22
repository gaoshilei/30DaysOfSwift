//
//  ViewController.swift
//  Day 6 - Simple PhotoBrower
//
//  Created by gaoshilei on 2019/7/22.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var photoBrower:PhotoBrower?
    override func viewDidLoad() {
        super.viewDidLoad()
        photoBrower = PhotoBrower.init(with: "IMG_3370.jpg",frame: self.view.bounds)
        self.view.addSubview(photoBrower!)
    }
}

