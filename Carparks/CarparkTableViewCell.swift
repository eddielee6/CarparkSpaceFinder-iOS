//
//  CarparkTableViewCell.swift
//  Carparks
//
//  Created by Eddie Lee on 28/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit

class CarparkTableViewCell: UITableViewCell {

    @IBOutlet weak private var carparkName: UILabel!
    @IBOutlet weak private var capacityProgressBar: UIProgressView!
    @IBOutlet weak private var capacityLabel: UILabel!
    @IBOutlet weak private var freeSpacesLabel: UILabel!
    
    func setCarpark(carpark: Carpark) {
        carparkName.text = carpark.carparkName
        capacityLabel.text = "\(carpark.capacity)"
        freeSpacesLabel.text = "\(carpark.freeSpaces)"
        capacityProgressBar.progress = carpark.occupancyPercentage/100
        capacityProgressBar.progressTintColor = carpark.statusColour
    }
}
