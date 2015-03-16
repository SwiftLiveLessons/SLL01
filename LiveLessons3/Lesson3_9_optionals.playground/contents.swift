// Playground - noun: a place where people can play

import UIKit

class MyClass {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

var myclass: MyClass? = MyClass(value: 42)
myclass

myclass = nil

myclass = MyClass(value: 1337)

if let unwrappedMyClass = myclass {
    println("myclass is not nil, and value = \(unwrappedMyClass.value)")
} else {
    println("myclass is nil")
}


// multiple if-let binding on one line
var a: Int? = 7, b: Int? = 4, c: Int? = 6
if let ua = a, ub = b, uc = c {
    let sum = ua + ub + uc
    println("\n\nmultiple if-let binding sum is \(sum)\n\n")
}

// multiple if-let binding on one line with where clause
if let ua = a, ub = b, uc = c where ua > ub {
    let sum = ua + ub + uc
    println("multiple if-let binding with where clause sum is \(sum)\n\n")
} else {
    println("this failed")
}

// multiple if-let binding on one line with where clause with leading boolean conditional
if myclass != nil, let ua = a, ub = b, uc = c where ua > ub {
    let sum = ua + ub + uc
    println("multiple if-let binding with where clause sum is \(sum)\n\n")
}


// using switch statements to unwrap
switch myclass {
case .Some(let unwrappedMyClass):
    println("in switch, myclass is not nil, and value = \(unwrappedMyClass.value)")
case .None:
    println("myclass is nil")
}


// nil coalescing
println("myclass?.value = \(myclass?.value)")

let newValue = myclass?.value ?? 0
println("newValue = \(newValue)")








