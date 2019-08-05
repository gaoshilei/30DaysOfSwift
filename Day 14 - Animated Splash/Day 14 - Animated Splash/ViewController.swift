//
//  ViewController.swift
//  Day 14 - Animated Splash
//
//  Created by gaoshilei on 2019/8/5.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,CAAnimationDelegate{

    @IBOutlet weak var imageView: UIImageView!
    var maskLayer:CALayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMask()
        addMaskAnimation()
    }
    
    func addMask() {
        maskLayer.contents = UIImage(named: "twitter")?.cgImage
        maskLayer.contentsGravity = .resizeAspect
        maskLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
        maskLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        imageView.layoutIfNeeded()
        maskLayer.position = CGPoint(x: imageView.frame.width*0.5, y: imageView.frame.height*0.5)
        imageView.layer.mask = maskLayer
    }
    
    func addMaskAnimation() {
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.6
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: .easeInEaseOut),CAMediaTimingFunction(name: .easeInEaseOut)]

        keyFrameAnimation.fillMode = .forwards
        keyFrameAnimation.isRemovedOnCompletion = false

        let initalBounds = NSValue(cgRect: maskLayer.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90, height: 72))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2200, height: 1800))
        keyFrameAnimation.values = [initalBounds,secondBounds,finalBounds]
        keyFrameAnimation.keyTimes = [0,0.3,1]
        maskLayer.add(keyFrameAnimation, forKey: "bounds")
    }
    
    
    ///animation delegate
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        imageView.layer.mask = nil
    }
}

