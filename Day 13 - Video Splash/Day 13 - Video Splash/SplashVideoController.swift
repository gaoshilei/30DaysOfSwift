//
//  SplashVideoController.swift
//  Day 13 - Video Splash
//
//  Created by gaoshilei on 2019/8/1.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

class SplashVideoController: UIViewController {

    private let videoPlayer = AVPlayerViewController()
    
    public var videoUrl : NSURL = NSURL() {
        didSet {
            setVideoUrl(url: videoUrl)
        }
    }
    
    public var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(item:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: videoPlayer.player?.currentItem)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        videoPlayer.view.frame = self.view.bounds
        videoPlayer.showsPlaybackControls = false
        view.addSubview(videoPlayer.view)
        view.sendSubviewToBack(videoPlayer.view)
    }
    
    func setVideoUrl(url:NSURL) {
        videoPlayer.player = AVPlayer(url: url as URL)
        videoPlayer.player?.play()
        videoPlayer.player?.volume = 0.0
    }
    
    @objc func playerItemDidReachEnd(item:AVPlayerItem) {
        videoPlayer.player?.seek(to: .zero)
        videoPlayer.player?.play()
        print("====== playerItemDidReachEnd ======")
    }
}
