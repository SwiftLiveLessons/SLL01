//
//  DealershipsViewController.swift
//  Lesson6_4
//
//  Created by BJ on 3/7/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit
import CoreData

class DealershipsViewController: UIViewController, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    var managedObjectContext: NSManagedObjectContext? {
        didSet {
            self.fetchedResultsController.performFetch(nil)
            self.tableView?.reloadData()
        }
    }
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        
        let fetchRequest = NSFetchRequest(entityName: "Dealership")
        fetchRequest.predicate = nil
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let moc = self.managedObjectContext ?? NSManagedObjectContext()
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        
        frc.delegate = self
        
        return frc
        }()

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        createSomeEntities()
    }
    
    func createSomeEntities() {
        if let moc = managedObjectContext {
            let dealership1 = Dealership.createDealership(lotID: 1, title: "Miller", brand: "Ford", numberOfCars: 100, inContext: moc)
            let dealership2 = Dealership.createDealership(lotID: 2, title: "Fisher", brand: "BMW", numberOfCars: 50, inContext: moc)
            
            let person1 = SalesPerson.salesPerson(100, name: "Mrs. White", inContext: moc)
            let person2 = SalesPerson.salesPerson(101, name: "Col. Mustard", inContext: moc)
            let person3 = SalesPerson.salesPerson(102, name: "Miss Scarlet", dealershipLotID: 3, dealershipTitle: "King James", brand: "Mercedes", numberOfCars: 200, inContext: moc)
            let person4 = SalesPerson.salesPerson(103, name: "Prof. Plum", inContext: moc)

            person1.employer = dealership1
            person2.employer = dealership2
            person4.employer = dealership1
            
            moc.save(nil)
        }
    }

    
    
    
    // MARK: table view data source methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        if fetchedResultsController.sections?.count ?? 0 > 0 {
            let sectionInfo: AnyObject? = fetchedResultsController.sections?[section]
            rows = sectionInfo?.numberOfObjects ?? 0
        }
        
        return rows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DealershipCell", forIndexPath: indexPath) as! UITableViewCell
        
        if fetchedResultsController.fetchedObjects?.isEmpty ?? true == false {
            let dealership = fetchedResultsController.objectAtIndexPath(indexPath) as! Dealership
            
            cell.textLabel?.text = dealership.title
            cell.detailTextLabel?.text = "\(dealership.salesStaff.count) staff"
        }
        
        return cell
    }

    // MARK: FRC delegate methods
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        
        switch type {
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath ?? NSIndexPath()], withRowAnimation: .Automatic)
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath ?? NSIndexPath()], withRowAnimation: .Automatic)
        case .Move:
            tableView.deleteRowsAtIndexPaths([indexPath ?? NSIndexPath()], withRowAnimation: .Automatic)
            tableView.insertRowsAtIndexPaths([newIndexPath ?? NSIndexPath()], withRowAnimation: .Automatic)
        case .Update:
            tableView.reloadRowsAtIndexPaths([indexPath ?? NSIndexPath()], withRowAnimation: .Automatic)
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSalesStaffSegue" {
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell) ?? NSIndexPath()
            let dealership = fetchedResultsController.objectAtIndexPath(indexPath) as! Dealership
            
            let destinationVC = segue.destinationViewController as! SalesStaffViewController
            destinationVC.salesStaff = dealership.salesStaff.allObjects as? [SalesPerson]
        }
    }


}
