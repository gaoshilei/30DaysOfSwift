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
    @IBOutlet weak var leftBarItem: UIBarButtonItem!
    @IBOutlet weak var rightBarItem: UIBarButtonItem!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label2: UILabel!
    
    private func setTabbarItem(icon:FAType!,item:UITabBarItem!) {
        item.setFAIcon(icon: icon, size: CGSize(width: 28, height: 28), orientation: .down, textColor: .black, backgroundColor: .white, selectedTextColor: .blue, selectedBackgroundColor: .white)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("===== ViewController viewDidLoad =====")
        setTabbarItem(icon: FAType.FAWeixin, item: tabbar?.items![0])
        setTabbarItem(icon: FAType.FAWeibo, item: tabbar?.items![1])
        setTabbarItem(icon: FAType.FATwitter, item: tabbar?.items![2])
        
        leftBarItem.setFAIcon(icon: FAType.FAThList, iconSize: 18)
        rightBarItem.setFAIcon(icon: FAType.FARefresh, iconSize: 18)
        
        slider.setFAMaximumValueImage(icon: FAType.FAYoutubePlay, orientation: .down, customSize: CGSize(width: 30, height: 30))
        slider.setFAMinimumValueImage(icon: FAType.FAXingSquare, orientation: .down, customSize: CGSize(width: 30, height: 30))
        
        textFiled.setLeftViewFAIcon(icon: FAType.FADollar, leftViewMode: .always, orientation: .down, textColor: .red, backgroundColor: .white, size: CGSize(width: 24, height: 24))
        textFiled.setRightViewFAIcon(icon: FAType.FARemove, rightViewMode: .whileEditing, orientation: .down, textColor: .gray, backgroundColor: .white, size: CGSize(width: 20, height: 20))
        
        stepper.setFADecrementImage(icon: FAType.FAVolumeDown, forState: .normal)
        stepper.setFAIncrementImage(icon: FAType.FAVolumeUp, forState: .normal)
        
        label.setFAText(prefixText: "Leon", icon: FAType.FAHeart, postfixText: "大石头", size: 30, iconSize: 40)
        label.setFAColor(color: .red)
        
        imageView.setFAIconWithName(icon: FAType.FAGithub, textColor: .red, orientation: .down, backgroundColor: .white, size: CGSize(width: 70, height: 70))
        
        button.setFAText(prefixText: "", icon: FAType.FASearch, postfixText: "查询", size: 30, forState: .normal)
        button.setFATitleColor(color: .blue, forState: .normal)
        
        label2.setFAText(prefixText: "欢迎关注我的微博 ", icon: FAType.FAWeibo, postfixText: " Leon大石头", size: 60, iconSize: 40)
    }
}

