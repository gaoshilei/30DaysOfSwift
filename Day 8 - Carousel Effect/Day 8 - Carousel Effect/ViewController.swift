//
//  ViewController.swift
//  Day 8 - Carousel Effect
//
//  Created by gaoshilei on 2019/7/24.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit
import SnapKit

let collectionCellReuseIdentifier = "carouselCell"

class ViewController: UIViewController,UICollectionViewDelegate {
    lazy var flowLayout = UICollectionViewFlowLayout()
    var collectionView:UICollectionView!
    var dataSource = SLCollectionViewDataSource()
    var dataList:Array<Array<String>>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEffectView()
        perpareData()
        setUpSuviews()
        weak var weakself = self
        dataSource.cellConfig = {(cell, indexPath) -> UICollectionViewCell in
            let cellT = cell as! CarouselCell
            cellT.imageName = weakself!.dataList![indexPath.row][0]
            cellT.descString = weakself!.dataList![indexPath.row][1]
            return cellT as UICollectionViewCell
        }
        dataSource.dataList = dataList
        dataSource.reuseIdentifier = collectionCellReuseIdentifier
    }
    
    func addEffectView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hexValue: 0xDE4313)?.cgColor,
            UIColor(hexValue: 0xE80505)?.cgColor,
            UIColor(hexValue: 0x002661)?.cgColor]
        gradientLayer.locations = [0.0,0.5,1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setUpSuviews()  {
        flowLayout.itemSize = CGSize(width: 300, height: 480)
        flowLayout.minimumLineSpacing = 15
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: collectionCellReuseIdentifier)
        self.view.addSubview(collectionView!)
        collectionView.snp.makeConstraints({ (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view).offset(80)
            make.bottom.equalTo(self.view).offset(-80)
        })
    }
    
    func perpareData() {
        dataList = [
            ["cover1.jpeg","Nothing is indestructible!"],
            ["cover2.jpeg","Nothing is indestructible!"],
            ["cover3.jpeg","Nothing is indestructible!"],
            ["cover4.jpeg","Nothing is indestructible!"],
            ["cover5.jpeg","Nothing is indestructible!"],
            ["cover6.jpeg","Nothing is indestructible!"]
        ]
    }
}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

