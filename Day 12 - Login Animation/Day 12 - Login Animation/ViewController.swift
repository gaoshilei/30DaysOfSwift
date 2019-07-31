//
//  ViewController.swift
//  Day 12 - Login Animation
//
//  Created by gaoshilei on 2019/7/31.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }

    @IBAction func loginOrSignUpAction () {
        let loginVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "loginVC")
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}

