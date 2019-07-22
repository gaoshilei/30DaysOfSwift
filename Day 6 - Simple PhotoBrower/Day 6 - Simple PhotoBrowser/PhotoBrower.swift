//
//  PhotoBrower.swift
//  Day 6 - Simple PhotoBrower
//
//  Created by gaoshilei on 2019/7/22.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class PhotoBrower: UIView,UIScrollViewDelegate,UIGestureRecognizerDelegate {
    var containerView:UIScrollView!
    var zoomGesture:UITapGestureRecognizer?
    var imageView:UIImageView!
    
    var imageName:String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(with name:String,frame:CGRect) {
        self.init(frame:frame)
        imageName = name
        setUpSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createZoomGesture() {
        zoomGesture = UITapGestureRecognizer.init(target: self, action: #selector(doubleTapAction(gesture:)))
        zoomGesture?.numberOfTapsRequired = 2;
        zoomGesture?.numberOfTouchesRequired = 1
        zoomGesture?.delegate = self
        imageView?.addGestureRecognizer(zoomGesture!)
    }
    
    @objc func doubleTapAction(gesture:UITapGestureRecognizer) {
        var scale = containerView.zoomScale
        if scale>1.0 {
            scale = 1.0
        }else if scale>0.5&&scale<=1.0 {
            scale = 0.5
        }else {
            scale = 3.0
        }
        containerView.setZoomScale(CGFloat(scale), animated: true)
    }
    
    func setUpSubviews() {
        containerView = UIScrollView.init(frame: self.frame)
        containerView?.showsVerticalScrollIndicator = false
        containerView?.showsHorizontalScrollIndicator = false
        containerView?.delegate = self
        containerView?.contentSize = self.bounds.size
        containerView?.minimumZoomScale = 0.5
        containerView?.maximumZoomScale = 3.0
        
        self.addSubview(containerView!)
        
        imageView = UIImageView.init(image: UIImage.init(named: imageName))
        imageView?.frame = containerView!.bounds
        imageView?.contentMode = .scaleAspectFill
        imageView?.isUserInteractionEnabled = true
        
        containerView?.addSubview(imageView!)
        
        createZoomGesture()
    }
    func bringImageViewCenter() {
        if containerView!.zoomScale<=CGFloat(1.0) {
            imageView?.center = CGPoint(x:(containerView?.bounds.width)!*0.5,y:(containerView?.bounds.height)!*0.5)
        }
    }
}

extension PhotoBrower {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("scrollViewDidZoom")
        bringImageViewCenter()
    }
}
