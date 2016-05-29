//
//  Carpark.swift
//  Carparks
//
//  Created by Eddie Lee on 28/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit

struct Carpark {
    let CarparkName: String
    let Capacity: Int
    let Occupancy: Int
    let Location: Coordinates
    
    var FreeSpaces: Int {
        return Capacity - Occupancy
    }
    
    var OccupancyPercentage: Float {
        return (Float(Occupancy)/Float(Capacity)) * 100
    }
    
    var Status: CarparkStatus {
        switch OccupancyPercentage {
        case let op where op < 75:
            return .Good
        case let op where op > 75 && op < 95:
            return .Ok
        case let op where op > 95:
            return .Bad
        default:
            return .Unknown
        }
    }
    
    struct Coordinates {
        let Latitude: Float
        let Longitude: Float
    }
    
    enum CarparkStatus {
        case Unknown
        case Good
        case Ok
        case Bad
    }
}

// Colours
extension Carpark {
    var StatusColour: UIColor {
        switch Status {
        case .Unknown:
            return UIColor.darkGrayColor()
        case .Good:
            return UIColor.greenColor()
        case .Ok:
            return UIColor.orangeColor()
        case .Bad:
            return UIColor.redColor()
        }
    }
}