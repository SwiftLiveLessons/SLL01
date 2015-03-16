//
//  RepositoriesTableViewController.swift
//  FinalProject
//
//  Created by BJ on 3/1/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit
import CoreData

class RepositoriesTableViewController: CoreDataFRCTableViewController {

    var managedObjectContext: NSManagedObjectContext? {
        didSet {
            let fetchRequest = NSFetchRequest(entityName: "Repository")
            fetchRequest.predicate = nil
            let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptor]
            
            if let moc = managedObjectContext {
                fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
                println("number: \(fetchedResultsController?.fetchedObjects?.count ?? 0)")
            }
        }
    }
    
    var repositories = [Repository]() {
        didSet {
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func refreshButtonTapped(sender: UIBarButtonItem) {
        fetchRepositories()
    }
    
    func fetchRepositories() {
        let url = NSURL(string: "https://api.github.com/repositories")!
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url) { data, response, error in
            if let httpResponse = response as? NSHTTPURLResponse {
                switch httpResponse.statusCode {
                case 200..<300:
                    println("good status: \(httpResponse.statusCode)")
                    if let unwrappedData = data {
                        self.handleHTTPResult(.Value(Box(unwrappedData)))
                    } else {
                        self.handleHTTPResult(.Error(error))
                    }
                default:
                    println("error occurred: \(httpResponse.statusCode)")
                    self.handleHTTPResult(.Error(error))
                }
            }
        }
        task.resume()
    }
    
    private func handleHTTPResult(result: Result<NSData>) {
        switch result {
        case .Error(let error):
            println("An error occurred. Status code: \(error.code)")
        case .Value(let dataBox):
            let data = dataBox.value
            parseRepositories(data: data)
        }
    }

    private func parseRepositories(#data: NSData) {
        
        if let json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil),
            jsonDictArray = json as? [[String: AnyObject]] {
                for jsonDict in jsonDictArray {
                    if let repoID = jsonDict["id"] >>- JSONInt,
                        name = jsonDict["name"] >>- JSONString,
                        description = jsonDict["description"] >>- JSONString,
                        repoUrl = jsonDict["html_url"] >>- JSONString,
                        ownerDict = jsonDict["owner"] >>- JSONDict,
                        ownerName = ownerDict["login"] >>- JSONString,
                        avatarUrl = ownerDict["avatar_url"] >>- JSONString,
                        ownerUrl = ownerDict["html_url"] >>- JSONString,
                        moc = managedObjectContext {
                            Repository.createRepository(repoID, name: name, repoDescription: description, owner: ownerName, avatarURL: avatarUrl, ownerURL: ownerUrl, repoURL: repoUrl, inManagedObjectContext: moc)
                    }
                }
                managedObjectContext?.save(nil)
        }
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RepositoryCell", forIndexPath: indexPath) as! UITableViewCell
        
        if let repository = fetchedResultsController?.objectAtIndexPath(indexPath) as? Repository {
            cell.textLabel?.text = repository.name
        }
        
        return cell
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRepositoryDetails",
            let destinationVC = segue.destinationViewController as? DetailViewController,
            selectedCell = sender as? UITableViewCell,
            selectedIndexPath = tableView.indexPathForCell(selectedCell),
            selectedRepo = fetchedResultsController?.objectAtIndexPath(selectedIndexPath) as? Repository {
                destinationVC.repository = selectedRepo
        }

    }

    
}
