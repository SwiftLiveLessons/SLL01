//
//  DealershipExtension.swift
//  CarLot
//
//  Created by BJ on 2/23/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation
import CoreData

extension Dealership {
    
    static func createDealership(lotID id: Int, title: String, brand: String, numberOfCars cars: Int, inContext moc: NSManagedObjectContext) -> Dealership {

        var dealership: Dealership!
        
        // check if this exists first
        
        let request = NSFetchRequest(entityName: "Dealership")
        request.predicate = NSPredicate(format: "lotID = %d", id)
        
        var error: NSError?
        let matches = moc.executeFetchRequest(request, error: &error)
        
        if matches == nil {
            println("error fetching for Dealerships")
        } else if let found = matches where found.count == 1 {
            println("matches: \(found.count). \(found)")
            if let dlrshp: AnyObject = found.first {
                println("dealership found")
                dealership = dlrshp as! Dealership
            } else {
                println("dealership could not be converted to Dealership object")
            }
        } else {
            dealership = NSEntityDescription.insertNewObjectForEntityForName("Dealership", inManagedObjectContext: moc) as! Dealership
            dealership.lotID = id
            dealership.title = title
            dealership.numberOfCars = cars
            dealership.brand = brand
        }
        
        return dealership
    }
    
}