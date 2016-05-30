//
//  CarparkTabBarViewController.swift
//  Carparks
//
//  Created by Eddie Lee on 30/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit

class CarparkTabBarViewController: UITabBarController {
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if let selectedNavigationController = viewControllers?[selectedIndex] as? UINavigationController {
            selectedNavigationController.popToRootViewControllerAnimated(false)
        }
    }
}
