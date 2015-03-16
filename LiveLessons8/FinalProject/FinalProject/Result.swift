//
//  Result.swift
//  FinalProject
//
//  Created by BJ on 3/1/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation

class Box<T> {
    var value: T
    init(_ value: T) { self.value = value }
}

enum Result<T> {
    case Error(NSError)
    case Value(Box<T>)
}