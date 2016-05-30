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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView?.addAnnotations(CarparkStore.sharedInstance.carparks)
    }
    
    // MARK: - MKMapView delegate
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation.isKindOfClass(Carpark.self) else {
            return nil
        }
                
        let annotationView = getMapAnnotationViewForAnnotation(annotation)
        annotationView.pinTintColor = (annotationView.annotation as! Carpark).statusColour
        return annotationView
    }
    
    func getMapAnnotationViewForAnnotation(annotation: MKAnnotation) -> MKPinAnnotationView {
        let identifier = "CarparkLocation"
        
        if let annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) {
            annotationView.annotation = annotation
            return annotationView as! MKPinAnnotationView
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
