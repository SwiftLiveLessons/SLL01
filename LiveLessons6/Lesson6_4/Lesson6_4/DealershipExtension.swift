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
        
        let matches: [AnyObject]?
        do {
            matches = try moc.executeFetchRequest(request)
        } catch {
            matches = nil
					print("error executing fetch request: \(error)")
        }
        
        if matches == nil {
            print("error fetching for Dealerships")
        } else if let found = matches where found.count == 1 {
            print("matches: \(found.count). \(found)")
            if let dlrshp: AnyObject = found.first {
                print("dealership found")
                dealership = dlrshp as! Dealership
            } else {
                print("dealership could not be converted to Dealership object")
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