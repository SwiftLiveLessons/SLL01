// Playground - noun: a place where people can play

import UIKit

// global functions
func globalAdd(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
globalAdd(1, num2: 2)

// built-in global functions
let numbers = [1, 2, 3, 4, 5]
func dbl(num: Int) -> Int {
    return num * 2
}
let doubles = numbers.map(dbl)

func isOdd(num: Int) -> Bool {
    return num % 2 == 1
}
let odds = numbers.filter(isOdd)

func add(n1: Int, n2: Int) -> Int {
    return n1 + n2
}
let sum = numbers.reduce(0, combine: add)

// nested functions
func globalFunc(value: String) {
    
    func nestedFunc() {
        let stringCount =  value.characters.count
        print("\(value) has \(stringCount) characters")
    }
    
    //    print("stringCount is \(stringCount)")  // no access
    nestedFunc()
}
globalFunc("Hippos are hungry!")


// closures
let subtractClosure: (Int, Int) -> Int = { (item1: Int, item2: Int) -> Int in item1 - item2 }
subtractClosure(5, 6)


// map
let triples = numbers.map( {(item: Int) -> Int in item * 3 } )
triples

// filter
let evens =  numbers.filter( {(item: Int) -> Bool in item % 2 == 0 } )
evens

// reduce
let product = numbers.reduce(1, combine:{ (item1: Int, item2: Int) -> Int in
    item1 * item2
})
product
