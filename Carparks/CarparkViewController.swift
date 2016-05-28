//
//  CarparkViewController.swift
//  Carparks
//
//  Created by Eddie Lee on 28/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit

class CarparkViewController: UIViewController {
    
    @IBOutlet weak var occupancyPercentageProgressBar: UIProgressView!
    
    var carpark: Carpark! {
        didSet {
            setupView()
        }
    }
    
    private func setupView() {
        title = carpark.CarparkName
        occupancyPercentageProgressBar?.progress = Float(carpark.Occupancy) / Float(carpark.Capacity)
        occupancyPercentageProgressBar?.progressTintColor = getTintColourForStatus(carpark.Status)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
