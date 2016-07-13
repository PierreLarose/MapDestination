//
//  DestinationNameController.swift
//  VacationDestination
//
//  Created by Pierre Larose on 1/6/15.
//  Copyright (c) 2015 Pierre Larose. All rights reserved.
//

import UIKit

class DestinationNameController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Roll Tide...
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mapSegue" {
            let mapController = segue.destinationViewController as! MapViewController
            mapController.destinationName = self.nameTextField.text!
        }
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
