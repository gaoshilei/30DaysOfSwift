//
//  dataSource.swift
//  Day 8 - Carousel Effect
//
//  Created by gaoshilei on 2019/7/24.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

typealias cellConfigCallBack = (UICollectionViewCell,NSIndexPath) -> (UICollectionViewCell)

class SLCollectionViewDataSource: NSObject, UICollectionViewDataSource{
    
    public var dataList:Array<Any>?
    public var reuseIdentifier:String!
    public var cellConfig:cellConfigCallBack!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if cellConfig != nil {
            return cellConfig!(cell,indexPath as NSIndexPath)
        }else {
            return cell
        }
    }
    
}
