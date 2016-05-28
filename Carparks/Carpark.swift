//
//  Carpark.swift
//  Carparks
//
//  Created by Eddie Lee on 28/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import Foundation

struct Carpark {
    let CarparkName: String
    let Capacity: Int
    let Occupancy: Int
    
    var Status: CarparkStatus {
        let occupancyPercentage = (Float(Occupancy)/Float(Capacity)) * 100
        
        switch occupancyPercentage {
        case _ where occupancyPercentage < 75:
            return .Good
        case _ where occupancyPercentage > 75 && occupancyPercentage < 95:
            return .Ok
        case _ where occupancyPercentage > 95:
            return .Bad
        default:
            return .Unknown
        }
    }
    
    enum CarparkStatus {
        case Unknown
        case Good
        case Ok
        case Bad
    }
}