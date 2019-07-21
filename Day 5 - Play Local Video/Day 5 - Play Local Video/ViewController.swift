//
//  ViewController.swift
//  Day 5 - Play Local Video
//
//  Created by gaoshilei on 2019/7/21.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataList = [
        VideoInfo(image: "Steven Universe The Movie | Official Trailer | Cartoon Network", duration: "1:51", name: "Steven Universe The Movie | Official Trailer | Cartoon Network"),
        VideoInfo(image: "Top Gun- Maverick - Official Trailer (2020) - Paramount Pictures", duration: "2:13", name: "Top Gun: Maverick - Official Trailer (2020) - Paramount Pictures"),
        VideoInfo(image: "The Walking Dead Season 10 Comic-Con Trailer", duration: "4:09", name: "The Walking Dead Season 10 Comic-Con Trailer"),
        VideoInfo(image: "Jay Leno has the first look at the 2020 Chevrolet Corvette Stingray - Jay Leno's Garage", duration: "7:46", name: "Jay Leno has the first look at the 2020 Chevrolet Corvette Stingray - Jay Leno's Garage"),
        VideoInfo(image: "Sam Smith - How Do You Sleep? (Official Video)", duration: "3:49", name: "Sam Smith - How Do You Sleep? (Official Video)"),
        VideoInfo(image: "Top Gun- Maverick - Official Trailer (2020) - Paramount Pictures", duration: "2:13", name: "Top Gun: Maverick - Official Trailer (2020) - Paramount Pictures"),
        VideoInfo(image: "The Walking Dead Season 10 Comic-Con Trailer", duration: "4:09", name: "The Walking Dead Season 10 Comic-Con Trailer"),
        VideoInfo(image: "Jay Leno has the first look at the 2020 Chevrolet Corvette Stingray - Jay Leno's Garage", duration: "7:46", name: "Jay Leno has the first look at the 2020 Chevrolet Corvette Stingray - Jay Leno's Garage"),
        VideoInfo(image: "Sam Smith - How Do You Sleep? (Official Video)", duration: "3:49", name: "Sam Smith - How Do You Sleep? (Official Video)"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func playBtnClick(_ sender: Any) {
        guard let videoPath = Bundle.main.path(forResource: "Steven Universe The Movie _ Official Trailer _ Cartoon Network", ofType: "mp4") else {
            print("ERROR: can not find video file!")
            return
        }
        let asset = AVAsset(url: URL(fileURLWithPath: videoPath))
        let playItem = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: playItem)
        let playController = AVPlayerViewController()
        playController.player = player
        self.present(playController, animated: true) {
            player.play()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "localVideoCell", for: indexPath) as! VideoCell
        let item = dataList[indexPath.row]
        cell.titleLabel.text = item.name
        cell.timeLabel.text = "时长：\(item.duration)"
        cell.coverImageView?.image = UIImage(named: item.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

