//
//  Repository.swift
//  FinalProject
//
//  Created by BJ on 3/1/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation
import CoreData

class Repository: NSManagedObject {

    @NSManaged var repoID: NSNumber
    @NSManaged var name: String
    @NSManaged var repoDescription: String
    @NSManaged var owner: String
    @NSManaged var avatarURL: String
    @NSManaged var ownerURL: String
    @NSManaged var repoURL: String

}


// this is a test. this is another test. can you hear me typing?
// this is another test. this is with an external keyboard on top of a  mousepad for cushioning.
// i have hooked up the boom arm to the microphone and connected to another piece of furniture. this should reduce the tapping boom. 
// this is anotehr test of me typing while using external keyboard and trackpad. cushioned by mousepad. the microphone is on a boom arm also, and i'm facing it. 
// thatlkjaesrijt testing some more typing.