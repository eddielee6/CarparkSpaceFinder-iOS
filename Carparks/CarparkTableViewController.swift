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
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CarparkStore.sharedInstance.carparks.count
    }
    
    struct Storyboard {
        static let carparkCellIdentifier = "carparkCell"
        static let showCarparkSegue = "showCarpark"
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.carparkCellIdentifier, forIndexPath: indexPath)
        
        if let carparkCell = cell as? CarparkTableViewCell {
            carparkCell.setCarpark(CarparkStore.sharedInstance.carparks[indexPath.row])
        }

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Storyboard.showCarparkSegue {
            if let carparkViewController = segue.destinationViewController as? CarparkViewController {
                if let cell = sender as? CarparkTableViewCell {
                    if let indexPath = tableView.indexPathForCell(cell) {
                        carparkViewController.carpark = CarparkStore.sharedInstance.carparks[indexPath.row]
                    }
                }
            }
        }
    }
}
