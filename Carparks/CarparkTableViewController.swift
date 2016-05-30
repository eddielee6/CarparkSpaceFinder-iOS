//
//  CarparkTableViewController.swift
//  Carparks
//
//  Created by Eddie Lee on 28/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit
import MapKit

class CarparkTableViewController: UITableViewController {
    
    var carparks = [Carpark]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Carparks"
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        for i in 1...100 {
            let name = "Carpark \(i)"
            let capacity = Int.random(between: 100, and: 1000)
            let occupancy = Int.random(between: capacity/3, and: capacity)
            
            let latitude = CLLocationDegrees(Float.random(between: 52, and: 53))
            let longitude = CLLocationDegrees(Float.random(between: -1.1, and: -1.9))
            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let carpark = Carpark(withLocation: coordinates, name: name, capacity: capacity)
            carpark.occupancy = occupancy
                
            carparks.append(carpark)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carparks.count
    }
    
    struct Storyboard {
        static let carparkCellIdentifier = "carparkCell"
        static let showCarparkSegue = "showCarpark"
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.carparkCellIdentifier, forIndexPath: indexPath)
        
        if let carparkCell = cell as? CarparkTableViewCell {
            carparkCell.setCarpark(carparks[indexPath.row])
        }

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Storyboard.showCarparkSegue {
            if let carparkViewController = segue.destinationViewController as? CarparkViewController {
                if let cell = sender as? CarparkTableViewCell {
                    if let indexPath = tableView.indexPathForCell(cell) {
                        carparkViewController.carpark = carparks[indexPath.row]
                    }
                }
            }
        }
    }
}
