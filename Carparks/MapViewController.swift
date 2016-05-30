//
//  MapViewController.swift
//  Carparks
//
//  Created by Eddie Lee on 30/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

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
    
    // MARK: - MKMapView delegate
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation.isKindOfClass(Carpark.self) else {
            return nil
        }
        
        let identifier = "CarparkLocation"
        
        if let annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) {
            annotationView.annotation = annotation
            return annotationView
        } else {
            let annotationView = MKPinAnnotationView(annotation:annotation, reuseIdentifier:identifier)
            annotationView.enabled = true
            annotationView.canShowCallout = true
            
            let btn = UIButton(type: .DetailDisclosure)
            annotationView.rightCalloutAccessoryView = btn
            return annotationView
        }
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            performSegueWithIdentifier(Storyboard.showCarparkSegue, sender: view)
        }
    }

    
    // MARK: - Navigation
    
    struct Storyboard {
        static let showCarparkSegue = "showCarpark"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Storyboard.showCarparkSegue {
            if let carparkViewController = segue.destinationViewController as? CarparkViewController {
                if let carpark = ((sender as? MKAnnotationView)?.annotation as? Carpark) {
                    carparkViewController.carpark = carpark
                }
            }
        }
    }
}
