//
//  Veggie.swift
//  Lesson5ObjC
//
//  Created by BJ on 2/28/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation

// Swift 2 update: This class previously conformed to the `Printable` protocol to provide the `description` property, which is now `CustomStringConvertible`.
//  This is now obtained automatically by virtue of subclassing NSObject, so the protocol conformance was redundant.
class Veggie: NSObject {
    let name: String
    let color: String
    let calories: Int
    
    init(name: String, color: String, calories: Int) {
        self.name = name
        self.color = color
        self.calories = calories
    }
    
    override var description: String {
        return "\(color) \(name) has \(calories) calories"
    }
}