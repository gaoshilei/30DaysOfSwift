//
//  PhotoBrower.swift
//  Day 6 - Simple PhotoBrower
//
//  Created by gaoshilei on 2019/7/22.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class PhotoBrower: UIView,UIScrollViewDelegate {
    var containerView:UIScrollView?
    var zoomGesture:UIGestureRecognizer?
    var imageView:UIImageView?
    
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
        
        containerView?.addSubview(imageView!)
    }
    func bringImageViewCenter() {
        if containerView!.zoomScale<CGFloat(1.0) {
            imageView?.center = CGPoint(x:(containerView?.bounds.width)!*0.5,y:(containerView?.bounds.height)!*0.5)
        }
    }
}

extension PhotoBrower {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print(scrollView)
        return imageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        bringImageViewCenter()
    }
}
