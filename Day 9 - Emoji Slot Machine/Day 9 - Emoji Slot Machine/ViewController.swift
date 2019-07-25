//
//  ViewController.swift
//  Day 9 - Emoji Slot Machine
//
//  Created by gaoshilei on 2019/7/25.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init?(hexValue:UInt32) {
        let r = CGFloat((hexValue & 0xFF000000)>>24)/255
        let g = CGFloat((hexValue & 0x00FF0000)>>16)/255
        let b = CGFloat((hexValue & 0x0000FF00)>>8)/255
        let a = CGFloat((hexValue & 0x000000FF))
        self.init(red:r,green:g,blue:b,alpha:a)
    }
}

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    let fruits = ["🍎","🍉","🍇","🌶","🍓","🍑","🍌","🍋"]
    var component1Row:Array<Int> = Array()
    var component2Row:Array<Int> = Array()
    var component3Row:Array<Int> = Array()
    var isVip:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBgColor()
        prepareData()
        configPickerView()
    }
    
    @IBAction func startAction(_ sender: Any) {
        var index1:Int
        var index2:Int
        var index3:Int
        index1 = (Int)(arc4random()%98) + 1
        if isVip {
            index2 = component2Row.firstIndex(of: component1Row[index1])!
            index3 = component3Row.firstIndex(of: component1Row[index1])!
        }else {
            index2 = (Int)(arc4random()%98) + 1
            index3 = (Int)(arc4random()%98) + 1
        }
        pickerView.selectRow(index1, inComponent: 0, animated: true)
        delayTime(by: 0.15){
            self.pickerView.selectRow(index2, inComponent: 1, animated: true)
            delayTime(by: 0.15) {
                self.pickerView.selectRow(index3, inComponent: 2, animated: true)
            }
        }
        let isCorrect = fruits[component1Row[index1]] == fruits[component2Row[index2]] && fruits[component2Row[index2]] == fruits[component3Row[index3]]
        delayTime(by: 0.35) {
            if isCorrect {
                self.resultLabel.text = "👏👏👏Congratulation!"
            }else {
                self.resultLabel.text = "🙀🙀🙀"
            }
        }
    }
    
    func prepareData() {
        for _ in 1...100 {
            component1Row.append((Int)(arc4random()%8))
            component2Row.append((Int)(arc4random()%8))
            component3Row.append((Int)(arc4random()%8))
        }
    }

    func setupBgColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.colors = [UIColor(hexValue: 0x64b3f4)?.cgColor as Any,UIColor(hexValue: 0xc2e59c)?.cgColor as Any]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func vipSwitch(_ sender: UISwitch) {
        isVip = sender.isOn
    }
    
    func configPickerView() {
        pickerView.isUserInteractionEnabled = false
        pickerView.dataSource = self
        pickerView.delegate = self
    }
}

extension ViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component1Row.count
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.font = UIFont(name: "Apple Color Emoji", size: 70)
        label.textAlignment = .center
        switch component {
        case 0:
            label.text = fruits[component1Row[row]]
            break
        case 1:
            label.text = fruits[component2Row[row]]
            break
        case 2:
            label.text = fruits[component3Row[row]]
        default:
            break
        }
        return label
    }
}

