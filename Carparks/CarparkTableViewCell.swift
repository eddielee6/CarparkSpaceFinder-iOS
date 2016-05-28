//
//  CarparkTableViewCell.swift
//  Carparks
//
//  Created by Eddie Lee on 28/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit

class CarparkTableViewCell: UITableViewCell {

    @IBOutlet weak var carparkName: UILabel!
    @IBOutlet weak var capacityProgressBar: UIProgressView!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var freeSpacesLabel: UILabel!
    
    func setCarpark(carpark: Carpark) {
        carparkName.text = carpark.CarparkName
        capacityLabel.text = "\(carpark.Capacity)"
        let freeSpaces = carpark.Capacity - carpark.Occupancy
        freeSpacesLabel.text = "\(freeSpaces)"
        capacityProgressBar.progress = Float(carpark.Occupancy) / Float(carpark.Capacity)
        capacityProgressBar.progressTintColor = getTintColourForStatus(carpark.Status)        
    }
    
    private func getTintColourForStatus(status: Carpark.CarparkStatus) -> UIColor {
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
