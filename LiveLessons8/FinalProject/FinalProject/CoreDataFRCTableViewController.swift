//
//  CoreDataFRCTableViewController.swift
//  CarLot
//
//  Created by BJ on 2/23/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit
import CoreData

class CoreDataFRCTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    private var _frc: NSFetchedResultsController?

    var debug = true

    var fetchedResultsController: NSFetchedResultsController? {
        get {
            return _frc
        }
        set {
            let oldFRC = _frc
            if newValue !== oldFRC {
                _frc = newValue
                _frc?.delegate = self
                self.title = _frc?.fetchRequest.entity?.name ?? ""
            }
            if newValue != nil {
                performFetch()
            } else {
                tableView.reloadData()
            }
        }
    }
    
    
    func performFetch() {
        if let frc = fetchedResultsController {
            if frc.fetchRequest.predicate != nil {
                if debug {
                    print("[\(NSStringFromClass(self.classForCoder))] fetching \(frc.fetchRequest.entityName ?? String()) with predicate \(frc.fetchRequest.predicate?.description ?? String())]")
                }
            } else {
                if debug {
                    print("[\(NSStringFromClass(self.classForCoder))] fetching all \(frc.fetchRequest.entityName ?? String())")
                }
            }
            do {
                try frc.performFetch()
            } catch let error as NSError {
                print("[\(NSStringFromClass(self.classForCoder))] performFetch: failed")
                print("[\(NSStringFromClass(self.classForCoder))] error: \(error.localizedDescription) [\(error.localizedFailureReason)]")
            }
        } else {
            if debug {
                print("[\(NSStringFromClass(self.classForCoder))] no FRC")
            }
        }
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController?.sections?.count ?? 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        if fetchedResultsController?.sections?.count ?? 0 > 0 {
            let sectionInfo: AnyObject? = fetchedResultsController?.sections?[section]
            rows = sectionInfo?.numberOfObjects ?? 0
        }
        
        return rows
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "" //fetchedResultsController?.sections?[section].name ?? ""
    }
    
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return fetchedResultsController?.sectionForSectionIndexTitle(title, atIndex: index) ?? 0
    }
	
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return fetchedResultsController?.sectionIndexTitles
    }
    
    // FRC delegate methods
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        
        switch type {
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        default:
            break
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath ?? NSIndexPath()], withRowAnimation: .Fade)
        case .Update:
            tableView.reloadRowsAtIndexPaths([indexPath ?? NSIndexPath()], withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath ?? NSIndexPath()], withRowAnimation: .Fade)
        case .Move:
            tableView.deleteRowsAtIndexPaths([indexPath ?? NSIndexPath()], withRowAnimation: .Fade)
            tableView.insertRowsAtIndexPaths([newIndexPath ?? NSIndexPath()], withRowAnimation: .Fade)
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }

}
