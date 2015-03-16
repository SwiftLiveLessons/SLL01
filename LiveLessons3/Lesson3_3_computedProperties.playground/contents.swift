// Playground - noun: a place where people can play

import UIKit

class Square {
    var sideLength = 0.0
    
    var area: Double {
        get {
            return sideLength * sideLength
        }
        set {
            sideLength = sqrt(Double(newValue))
        }
    }
}

let square = Square()
square.sideLength = 4
square.area

square.area = 49


var questionsAnswered = [true, true, false, true]
var examComplete: Bool {
get {
    return !contains(questionsAnswered) { $0 == false }
}
set {
    questionsAnswered = [Bool](count: questionsAnswered.count, repeatedValue: true)
}
}
examComplete
examComplete = true
questionsAnswered