// Playground - noun: a place where people can play

import UIKit

func addNumbers(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
addNumbers(2, 3)

func addVariadicParameters(numbers: Int...) -> Int {
    var result = 0
    for number in numbers {
        result += number
    }
    return result
}
addVariadicParameters(1, 2, 3, 4)

func changeName(inout name: String) {
    name = "Pete"
}
var myName = "BJ"
changeName(&myName)
myName

// external parameter
func multiply(thisNumber num1: Double, byThisNumber num2: Double) -> Double {
    return num1 * num2
}
multiply(thisNumber: 3.5, byThisNumber: 2.1)

func multiply2(#thisNumber: Double, #byThisNumber: Double) -> Double {
    return thisNumber * byThisNumber
}
multiply2(thisNumber: 4.0, byThisNumber: 2.5)

// default parameters
func greetAFamousPerson(#firstName: String, #lastName: String, salutation: String = "Mrs.") -> String {
    return "Hello, \(salutation) \(firstName) \(lastName)"
}
let JFK = greetAFamousPerson(firstName: "John", lastName: "Kennedy", salutation: "Mr.")
let JackieK = greetAFamousPerson(firstName: "Jackie", lastName: "Kennedy")

