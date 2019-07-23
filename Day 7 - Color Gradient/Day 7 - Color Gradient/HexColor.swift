//
//  HexColor.swift
//  Day 7 - Color Gradient
//
//  Created by gaoshilei on 2019/7/23.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init?(hexValue:UInt32) {
        if hexValue<0x10 {
            return nil
        }
        let r = CGFloat((hexValue & 0xFF000000) >> 24)/255
        let g = CGFloat((hexValue & 0x00FF0000) >> 16)/255
        let b = CGFloat((hexValue & 0x0000FF00) >> 8)/255
        let a = CGFloat(hexValue & 0x000000FF)/255
        self.init(red:r,green:g,blue:b,alpha:a)
    }
    
    convenience init?(rgb r:CGFloat,g:CGFloat,b:CGFloat) {
        self.init(red:CGFloat(r/255),green:CGFloat(g/255),blue:CGFloat(b/255),alpha:1)
    }
}
