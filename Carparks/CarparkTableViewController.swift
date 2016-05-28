//
//  CarparkTableViewController.swift
//  Carparks
//
//  Created by Eddie Lee on 28/05/2016.
//  Copyright © 2016 Eddie Lee. All rights reserved.
//

import UIKit

class CarparkTableViewController: UITableViewController {
    
    var carparks = [Carpark]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Carparks"
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        for i in 1...100 {
            let capacity = randomInt(between: 100, and: 1000)
            let occupancy = randomInt(between: capacity/3, and: capacity)
            let carpark = Carpark(CarparkName: "Carpark \(i)", Capacity: capacity, Occupancy: occupancy)
            carparks.append(carpark)
        }
    }
    
    func randomInt(between from: Int, and to: Int) -> Int {
        let range = UInt32(to) - UInt32(from)
        return Int(arc4random_uniform(range)) + from;
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
