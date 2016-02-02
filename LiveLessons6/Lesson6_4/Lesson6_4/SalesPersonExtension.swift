//
//  SalesPersonExtension.swift
//  CarLot
//
//  Created by BJ on 2/23/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation
import CoreData

extension SalesPerson {
    
    static func salesPerson(employeeID: Int, name: String, inContext moc: NSManagedObjectContext) -> SalesPerson {
        
        var salesPerson: SalesPerson!
        
        let request = NSFetchRequest(entityName: "SalesPerson")
        request.predicate = NSPredicate(format: "name = %@", name)
        
        var error: NSError?
        let possibleMatches: [AnyObject]?
        do {
            possibleMatches = try moc.executeFetchRequest(request)
        } catch let error1 as NSError {
            error = error1
            print(error!)
            possibleMatches = nil
        }
        
        if possibleMatches == nil {
            print("error fetching SalesPersons")
        } else if let found = possibleMatches where found.count == 1 {
            salesPerson = found.first! as! SalesPerson
        } else {
            salesPerson = NSEntityDescription.insertNewObjectForEntityForName("SalesPerson", inManagedObjectContext: moc) as! SalesPerson
            salesPerson.employeeID = employeeID
            salesPerson.name = name
        }
        
        return salesPerson
        
    }
    
    static func salesPerson(employeeID: Int, name: String, dealershipLotID lotID: Int, dealershipTitle: String, brand: String, numberOfCars cars: Int, inContext moc: NSManagedObjectContext) -> SalesPerson {
        
        let salesPerson: SalesPerson = SalesPerson.salesPerson(employeeID, name: name, inContext: moc)
        
        salesPerson.employer = Dealership.createDealership(lotID: lotID, title: dealershipTitle, brand: brand, numberOfCars: cars, inContext: moc)
        
        return salesPerson
    }
    
}