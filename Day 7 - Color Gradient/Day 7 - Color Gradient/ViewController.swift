//
//  ViewController.swift
//  Day 7 - Color Gradient
//
//  Created by gaoshilei on 2019/7/23.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /**
     一天24小时，温度需要设置对应的12个值，14点对应的温度最高
     渐变也设置成12段，根据温度来改变
     */
    var gradientLayer:CAGradientLayer!
    var skyColor:UIColor!
    var bottomColor:UIColor!
    var gradientColors:[CGColor]!
    var gradientLocations:[NSNumber]! //定义每种颜色所在位置
    var colorSet = [CGColor]()
    var currentY:CGFloat! //滑动手势当前所在位置
    var startY:CGFloat! //滑动手势开始的位置
    var startIndex:CGFloat! = 0
    var currentIndex:CGFloat! = 0 //当前索引，用来设置温度、时间、渐变
    {
        didSet {
            if currentIndex>=0&&currentIndex<=24 {
                let index:CGFloat = currentIndex>12 ? 24-currentIndex : currentIndex
                timeLabel.text = String("\(Int(currentIndex!)):00")
                temperatureLabel.text = String("\(20+index)℃")
                print("currentIndex=\(currentIndex!)")
            }
        }
    }
    
    let skyDarknessG:CGFloat = 57
    let skyBrightnessG:CGFloat = 118
    let bottomDarknessG:CGFloat = 83
    let bottomBrightnessG:CGFloat = 153
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        changeColor(skyG: skyBrightnessG, bottomG: bottomBrightnessG)
    }
    
    func changeColor(skyG:CGFloat,bottomG:CGFloat) {
        skyColor = UIColor(rgb: 14, g: skyG, b: 166)
        bottomColor = UIColor(rgb: 217, g: bottomG, b: 42)
        gradientColors = [skyColor.cgColor,bottomColor.cgColor]
        gradientLayer.colors = gradientColors
    }
    
    func setUpSubviews() {
        gradientLayer = CAGradientLayer()
        gradientLocations = [0.0, 1.0]
        gradientLayer.locations = gradientLocations
        gradientLayer.frame = self.view.frame
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self.view)
        startY = location?.y
        startIndex = currentIndex
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self.view)
        currentY = location?.y
        let scopeH = self.view.frame.height/24
        let diffY = currentY - startY
        currentIndex = startIndex! + floor(diffY/scopeH)
        if  currentIndex>24 {
            currentIndex = 0
        }
        if currentIndex<0 {
            currentIndex = 24
        }
        let index:CGFloat = currentIndex>12 ? 24-currentIndex : currentIndex
        let skyColorG:CGFloat = skyBrightnessG-(skyBrightnessG-skyDarknessG)/12*index
        let bottomColorG:CGFloat = bottomBrightnessG-(bottomBrightnessG-bottomDarknessG)/12*index
        changeColor(skyG: skyColorG, bottomG: bottomColorG)
    }
}

