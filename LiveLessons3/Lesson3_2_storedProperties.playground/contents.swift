// Playground - noun: a place where people can play

import UIKit

// observing properties
class Thermometer {
    
    var temperature: Int = 0 {
        willSet {
            print("in temperature's willSet method, newValue is \(newValue)")
            // perform an animation effect on thermometer UI to newValue
        }
        didSet {
            print("in temperature's didSet method, oldValue is \(oldValue)")
            // perform a quick scaling animation to indicate animation is complete
        }
    }
}
let thermometer = Thermometer()
thermometer.temperature
thermometer.temperature = 72


// lazy properties
class ExpensiveClass {
    func expensiveOperation() -> Int {
        // something big happens here
        return 42
    }
}

class NormalClass {
    lazy var expensiveClass = ExpensiveClass()
}

let normal = NormalClass()
normal.expensiveClass.expensiveOperation()
