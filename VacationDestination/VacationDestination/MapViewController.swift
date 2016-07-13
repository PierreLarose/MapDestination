//
//  MapViewController.swift
//  VacationDestination
//
//  Created by Pierre Larose on 3/18/15.
//  Copyright (c) 2015 Pierre Larose. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var destinationName = ""
    var locationManager : CLLocationManager?
    var firstTime = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager?.requestWhenInUseAuthorization()
        
        self.locationManager?.delegate = self
        self.locationManager?.startUpdatingLocation()
        
        self.map.showsUserLocation = false
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if self.firstTime {
            let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 20000, 20000)
            self.map.setRegion(region, animated: false)
            self.firstTime = false
        }
    }
    
    @IBAction func saveTapped(sender: AnyObject) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
        
        let destination1 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as! Destination
        destination1.name = self.destinationName
        destination1.latt = self.map.region.center.latitude
        destination1.longi = self.map.region.center.longitude
        destination1.lattDelta = self.map.region.span.latitudeDelta
        destination1.longiDelta = self.map.region.span.longitudeDelta
        
        do {
            try context.save()
        } catch _ {
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
