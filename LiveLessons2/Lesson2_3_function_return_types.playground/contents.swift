// Playground - noun: a place where people can play

import UIKit

// no return type
func printName(name: String) {
    println("Hello, \(name)")
}
printName("Jeeves")

// single return type
func add(n1: Int, n2: Int) -> Int {
    return n1 + n2
}
func funcThatReturnsADictionary() -> [String : String] {
    return ["username": "jdoe", "password": "1234"]
}
let doe = funcThatReturnsADictionary
doe()

// multiple returns from functions
func tuple() -> (Double, String) {
    return (3.14, "pi")
}
let _tuple = tuple
tuple().0
tuple().1

func tupleWithNamedReturnParams() -> (value: Double, name: String) {
    return (3.14, "pi")
}
let _tupleWithNamedReturnParams = tupleWithNamedReturnParams
tupleWithNamedReturnParams().name
tupleWithNamedReturnParams().value

// inout parameters
var error: NSError?
func parse(data: String, inout error: NSError?) {
    // something bad happens
    error = NSError(domain: "Some domain", code: 400, userInfo: [NSLocalizedDescriptionKey : "Something very bad happened!"])
}
parse("fake json", &error)
error?.localizedDescription

// optional parameters
func stringToInt(numAsString: String) -> Int? {
    return numAsString.toInt()
}
stringToInt("42")
stringToInt("five")

func firstElement(inArray arr: [String]) -> String? {
    if arr.isEmpty {
        return nil
    } else {
        return arr[0]
    }
}
firstElement(inArray: ["A", "B", "C"])
firstElement(inArray: [])