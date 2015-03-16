//
//  SalesPerson.swift
//  Lesson6_4
//
//  Created by BJ on 3/8/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation
import CoreData

class SalesPerson: NSManagedObject {

    @NSManaged var employeeID: NSNumber
    @NSManaged var name: String
    @NSManaged var employer: Dealership

}
