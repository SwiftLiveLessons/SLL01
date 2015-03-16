//
//  Dealership.swift
//  Lesson6_4
//
//  Created by BJ on 3/8/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation
import CoreData

class Dealership: NSManagedObject {

    @NSManaged var lotID: NSNumber
    @NSManaged var title: String
    @NSManaged var brand: String
    @NSManaged var numberOfCars: NSNumber
    @NSManaged var salesStaff: NSSet

}
