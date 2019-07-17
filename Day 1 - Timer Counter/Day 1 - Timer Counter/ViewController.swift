//
//  ViewController.swift
//  Day 1 - Timer Counter
//
//  Created by gaoshilei on 2019/7/17.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    var isStoped:Bool = false
    
    var counter:Int = 0 {
        didSet {
            counterLabel.text = String(counter)
        }
    }
    
    var timer:Timer = Timer()
    
    
    @IBAction func startBtnPress(_ sender: Any) {
        if startBtn.isSelected {
            //已是暂停状态，需要启动timer
            startBtn.setImage(UIImage(named: "start"), for: .normal)
            timer.invalidate()
        }else {
            //已是开始状态，需要暂停timer
            startBtn.setImage(UIImage(named: "pause"), for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimerCount), userInfo: nil, repeats: true)
        }
        startBtn.isSelected = !startBtn.isSelected
    }
    
    @IBAction func stopBtnPress(_ sender: Any) {
        startBtn.isSelected = false;
        startBtn.setImage(UIImage(named: "start"), for: .normal)
        timer.invalidate()
        counter = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func updateTimerCount() {
        counter += 1
    }
}

