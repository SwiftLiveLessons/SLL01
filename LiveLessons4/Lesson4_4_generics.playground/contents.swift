// Playground - noun: a place where people can play

import UIKit

//func isEqual(n1: Int, n2: Int) -> Bool {
//    return n1 == n2
//}
//
//func isEqual(n1: Double, n2: Double) -> Bool {
//    return n1 == n2
//}
//
//func isEqual(s1: String, s2: String) -> Bool {
//    return s1 == s2
//}
//
//isEqual(5, n2: 5)
//isEqual(3.14, n2: 3.15)
//isEqual("Hi", s2: "Hello")


func isEqual<T: Equatable>(value1: T, value2: T) -> Bool {
    return value1 == value2
}
isEqual(5, value2: 5)
isEqual(3.14, value2: 3.15)
isEqual("Hi", value2: "Hello")


// generic functions
func fmap<T, U>(value: T?, f: T -> U) -> U? {
    switch value {
    case .Some(let x): return f(x)
    case .None: return .None
    }
}
var greeting: String? = "Bonjour!"

let charCount = fmap(greeting) { $0.characters.count } 
charCount


// associated types
protocol DataSourceProtocol {
    typealias ItemType
    func itemAtIndex(index: Int) -> ItemType?
}

class DataSource: DataSourceProtocol {
    
    typealias ItemType = String
    
    var items = [ItemType]()
    
    func itemAtIndex(index: Int) -> ItemType? {
        return index < items.count ? items[index] : nil
    }
}

let ds = DataSource()
ds.items = ["Ford", "Lincoln", "Mercury"]
ds.itemAtIndex(0)


// generic types
class Box<T> {
    var value: T
    init(_ value: T) {
        self.value = value
    }
}
let doubleBox = Box<Double>(3.14)
let intBox = Box(5)
let stringBox = Box("Bacon")











