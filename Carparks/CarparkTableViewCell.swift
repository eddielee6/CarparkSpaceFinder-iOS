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
        freeSpacesLabel.text = "\(carpark.FreeSpaces)"
        capacityProgressBar.progress = carpark.OccupancyPercentage/100
        capacityProgressBar.progressTintColor = carpark.StatusColour
    }
}
