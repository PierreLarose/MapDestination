//
//  Destination.swift
//  VacationDestination
//
//  Created by Pierre Larose on 1/6/15.
//  Copyright (c) 2015 Pierre Larose. All rights reserved.
//

import Foundation
import CoreData

class Destination: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var latt: NSNumber
    @NSManaged var longi: NSNumber
    @NSManaged var lattDelta: NSNumber
    @NSManaged var longiDelta: NSNumber

}
