//
//  ViewController.swift
//  Day 13 - Video Splash
//
//  Created by gaoshilei on 2019/8/1.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class ViewController: SplashVideoController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoPath = Bundle.main.path(forResource: "moments", ofType: "mp4")!
        let videoUrl = NSURL(fileURLWithPath: videoPath) as NSURL
        setVideoUrl(url: videoUrl)
        alwaysRepeat = true
    }
}

