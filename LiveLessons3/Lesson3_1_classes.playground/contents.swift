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
print(a.name)
print(b.name)

b.name = "Alice"
print(a.name)
print(b.name)

let c = SomeClass()

print("")

let anyString: AnyObject = "hello"
if let uString = anyString as? String {
    print("\(uString)")
}

print("")

let dict: [String : AnyObject] = ["age": 0]
if let age = dict["age"] as? Bool {
    print("age is \(age)")
}

class Downcasting {
    var view = UIView()
    func forceIt() {
        (view as! UILabel).text = "My text has been set if I am a UILabel"
        print("\((view as! UILabel).text)")
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
    print("anyString is a String")
}
