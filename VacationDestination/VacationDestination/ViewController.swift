//
//  ViewController.swift
//  VacationDestination
//
//  Created by Pierre Larose on 1/6/15.
//  Copyright (c) 2015 Pierre Larose. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var destinations: [Destination] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Roll Tide...
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //createTestDestinations()
    }
    
    override func viewWillAppear(animated: Bool) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
        let request = NSFetchRequest(entityName: "Destination")
        self.destinations = (try! context.executeFetchRequest(request)) as! [Destination]
        self.tableView.reloadData()
    }
    
    func createTestDestinations() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
        
        let destination1 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as! Destination
        destination1.name = "Tokyo"
        destination1.latt = 35.689487
        destination1.longi = 139.691706
        destination1.lattDelta = 5
        destination1.longiDelta = 5
        
        let destination2 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as! Destination
        destination2.name = "Provo"
        destination2.latt = 40.233844
        destination2.longi = -111.658534
        destination2.lattDelta = 1
        destination2.longiDelta = 1
        
        do {
            try context.save()
        } catch _ {
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.destinations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let destination = self.destinations[indexPath.row]
        let cell = self.tableView.dequeueReusableCellWithIdentifier("mapCell") as! MapCell
        cell.nameLabel.text = destination.name
        
        let coordinate = CLLocationCoordinate2DMake(destination.latt.doubleValue, destination.longi.doubleValue)
        let span = MKCoordinateSpanMake(destination.lattDelta.doubleValue, destination.longiDelta.doubleValue)
        let region = MKCoordinateRegionMake(coordinate, span)
        cell.mapView.setRegion(region, animated: false)
        
        return cell
    }

}

