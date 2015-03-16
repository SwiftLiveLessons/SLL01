// Playground - noun: a place where people can play

import UIKit

class SomeSuperClass {
    var age = 0
}

class SomeClass: SomeSuperClass {
    var name = ""
}
let a = SomeClass()
a.name = "John"

let b = a
println(a.name)
println(b.name)

b.name = "Alice"
println(a.name)
println(b.name)

let c = SomeClass()

println()

let anyString: AnyObject = "hello"
if let uString = anyString as? String {
    println("\(uString)")
}

println()

let dict: [String : AnyObject] = ["age": 0]
if let age = dict["age"] as? Bool {
    println("age is \(age)")
}

class Downcasting {
    var view = UIView()
    func forceIt() {
        (view as! UILabel).text = "My text has been set if I am a UILabel"
        println("\((view as! UILabel).text)")
    }
}
let downcasting = Downcasting()
//downcasting.forceIt()

// as
let upcastedStringToAnyObject: AnyObject = anyString as AnyObject

// is
let someString: String = "hi"
let anyObjectString: AnyObject = someString
if anyString is String {
    println("anyString is a String")
}