//
//  MapViewController.swift
//  Carparks
//
//  Created by Eddie Lee on 30/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak private var mapView: MKMapView!
    
    var carparks = [Carpark]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...100 {
            let name = "Carpark \(i)"
            let capacity = Int.random(between: 100, and: 1000)
            let occupancy = Int.random(between: capacity/3, and: capacity)
            
            let latitude = CLLocationDegrees(Float.random(between: 50.5, and: 55))
            let longitude = CLLocationDegrees(Float.random(between: -3, and: 0))
            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let carpark = Carpark(withLocation: coordinates, name: name, capacity: capacity)
            carpark.occupancy = occupancy
            
            carparks.append(carpark)
        }
        
        mapView?.addAnnotations(carparks)
    }
}
