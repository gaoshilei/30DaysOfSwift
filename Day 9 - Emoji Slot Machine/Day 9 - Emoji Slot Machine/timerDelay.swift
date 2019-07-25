//
//  timerDelay.swift
//  Day 9 - Emoji Slot Machine
//
//  Created by gaoshilei on 2019/7/25.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import Foundation

public func delayTime(by delay:TimeInterval, qos:DispatchQoS.QoSClass?=nil,_ closuer:@escaping () -> Void) {
    let queue = qos != nil ? DispatchQueue.global(qos: qos!) : .main
    queue.asyncAfter(deadline: DispatchTime.now()+delay, execute: closuer)
}
