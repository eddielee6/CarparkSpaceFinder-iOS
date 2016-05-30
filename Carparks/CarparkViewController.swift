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
    
    @IBOutlet weak private var occupancyPercentageProgressBar: UIProgressView!
    @IBOutlet weak private var mapView: MKMapView!
    @IBOutlet weak private var carparkNameLabel: UILabel!
    
    var carpark: Carpark!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = carpark.carparkName
        carparkNameLabel?.text = carpark.carparkName
        
        occupancyPercentageProgressBar?.progress = carpark.occupancyPercentage/100
        occupancyPercentageProgressBar?.progressTintColor = carpark.statusColour
        
        showCarparkOnMap()
        
    }
    
    @IBAction func shareCarpark(sender: AnyObject) {
        let text = "There are \(carpark.freeSpaces) free spaces in the \(carpark.carparkName) carpark"
        let carparkUrl = NSURL(string: "http://carpark-space-finder.herokuapp.com/bla")!
        let toShare = [text, carparkUrl]
        
        let activityViewController = UIActivityViewController(activityItems: toShare, applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    private func showCarparkOnMap() {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(carpark.location, regionRadius*2, regionRadius*2)
        mapView?.setRegion(coordinateRegion, animated: false)
        mapView?.addAnnotation(carpark)
        mapView?.selectedAnnotations = [carpark]
    }
}
