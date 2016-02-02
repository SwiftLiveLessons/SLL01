//
//  RepositoryExtension.swift
//  FinalProject
//
//  Created by BJ on 3/1/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation
import CoreData

extension Repository {
    
    static func createRepository(repoID: Int, name: String, repoDescription: String, owner: String, avatarURL: String, ownerURL: String, repoURL: String, inManagedObjectContext moc: NSManagedObjectContext) -> Repository? {
        
        var repository: Repository?
        
        let fetchRequest = NSFetchRequest(entityName: "Repository")
        fetchRequest.predicate = NSPredicate(format: "repoID = %d", repoID)
        
        let matches: [AnyObject]?
        do {
            matches = try moc.executeFetchRequest(fetchRequest)
        } catch {
            matches = nil
        }
        
        if matches == nil {
            print("There was an error fetching results")
        } else if let found = matches where found.count == 1 {
            repository = found.first as? Repository
        } else {
            repository = NSEntityDescription.insertNewObjectForEntityForName("Repository", inManagedObjectContext: moc) as? Repository
            repository?.repoID = repoID
            repository?.name = name
            repository?.repoDescription = repoDescription
            repository?.owner = owner
            repository?.avatarURL = avatarURL
            repository?.ownerURL = ownerURL
            repository?.repoURL = repoURL
        }
        
        return repository
        
    }
    
}