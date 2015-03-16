//
//  Operators.swift
//  FinalProject
//
//  Created by BJ on 3/1/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation

infix operator >>- { associativity left precedence 150 }
func >>-<A, B>(value: A?, f: A -> B?) -> B? {
    switch value {
    case .Some(let x): return f(x)
    case .None: return .None
    }
}