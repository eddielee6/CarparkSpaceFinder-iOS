//
//  CarparkTabBarViewController.swift
//  Carparks
//
//  Created by Eddie Lee on 30/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit
import CoreLocation

class CarparkTabBarViewController: UITabBarController {
    
    let locationManager = CLLocationManager()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        requestUserLocation()
    }
    
//    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
//        print(item)
//        if let selectedNavigationController = viewControllers?[selectedIndex] as? UINavigationController {
//            selectedNavigationController.popToRootViewControllerAnimated(false)
//        }
//    }
}

extension CarparkTabBarViewController: CLLocationManagerDelegate {
    private func requestUserLocation() {
        guard CLLocationManager.locationServicesEnabled() else {
            print("Location Services not available")
            return
        }
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}