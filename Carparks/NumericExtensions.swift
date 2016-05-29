//
//  NumericExtensions.swift
//  Carparks
//
//  Created by Eddie Lee on 29/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import Foundation

extension Int {
    static func random(between from: Int, and to: Int) -> Int {
        let range = UInt32(to) - UInt32(from)
        return Int(arc4random_uniform(range)) + from;
    }
}

extension Float {
    static func random(between from: Float, and to: Float) -> Float {
        let range = to - from
        return (Float(arc4random()) / Float(UINT32_MAX) * range) + from
    }
}