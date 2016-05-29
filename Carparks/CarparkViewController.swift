//
//  CarparkViewController.swift
//  Carparks
//
//  Created by Eddie Lee on 28/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit
import MapKit

class CarparkViewController: UIViewController {
    
    @IBOutlet weak var occupancyPercentageProgressBar: UIProgressView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var carparkNameLabel: UILabel!
    
    var carpark: Carpark! {
        didSet {
            setupView()
        }
    }
    
    private func setupView() {
        title = carpark.CarparkName
        carparkNameLabel?.text = carpark.CarparkName
        
        occupancyPercentageProgressBar?.progress = carpark.OccupancyPercentage/100
        occupancyPercentageProgressBar?.progressTintColor = carpark.StatusColour
        
        let carparkLocation = CLLocation(latitude: CLLocationDegrees(carpark.Location.Latitude), longitude: CLLocationDegrees(carpark.Location.Longitude))
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(carparkLocation.coordinate, regionRadius*2, regionRadius*2)
        mapView?.setRegion(coordinateRegion, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
