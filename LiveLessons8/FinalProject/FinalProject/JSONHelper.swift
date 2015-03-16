//
//  JSONHelper.swift
//  FinalProject
//
//  Created by BJ on 3/1/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation

typealias JSON = AnyObject
typealias JSONDictionary = [String : JSON]
typealias JSONDictionaryArray = [JSONDictionary]

func JSONString(object: JSON) -> String? {
    return object as? String
}

func JSONInt(object: JSON) -> Int? {
    return object as? Int
}

func JSONDict(object: JSON) -> JSONDictionary? {
    return object as? JSONDictionary
}