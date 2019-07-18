//
//  ViewController.swift
//  Day 2 - Iconfont
//
//  Created by gaoshilei on 2019/7/18.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabbar: UITabBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("===== ViewController viewDidLoad =====")
        
        tabbar?.items![0].setFAIcon(icon: FAType.FAWeixin)
        tabbar?.items![1].setFAIcon(icon: FAType.FAWeibo)
        tabbar?.items![2].setFAIcon(icon: FAType.FATwitter)
    }
}

