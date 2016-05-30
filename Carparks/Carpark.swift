//
//  Carpark.swift
//  Carparks
//
//  Created by Eddie Lee on 28/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit
import MapKit

class Carpark: NSObject {
    
    let carparkName: String
    let location: CLLocationCoordinate2D
    let capacity: Int
    var occupancy: Int = 0
    
    init(withLocation location: CLLocationCoordinate2D, name: String, capacity: Int) {
        self.location = location
        self.carparkName = name
        self.capacity = capacity
    }
    
    var freeSpaces: Int {
        return capacity - occupancy
    }
    
    var occupancyPercentage: Float {
        return (Float(occupancy)/Float(capacity)) * 100
    }
    
    var status: CarparkStatus {
        switch occupancyPercentage {
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
    
    enum CarparkStatus {
        case Unknown
        case Good
        case Ok
        case Bad
    }
}

// Colours
extension Carpark {
    var statusColour: UIColor {
        switch status {
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

// MKAnnotation
extension Carpark: MKAnnotation {
    convenience init(withLocation location: CLLocationCoordinate2D) {
        self.init(withLocation: location, name: "", capacity: 0)
    }
    
    var coordinate: CLLocationCoordinate2D {
        return location
    }
    
    var title: String? {
        return carparkName
    }
    
    var subtitle: String? {
        return "\(freeSpaces) Free Spaces"
    }
}