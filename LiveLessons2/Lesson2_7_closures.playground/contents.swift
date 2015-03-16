// Playground - noun: a place where people can play

import UIKit

// assign as variable or constant
let hasRemainder: Int -> Bool = { (item: Int) in return item % 2 == 1 }
hasRemainder(4)
hasRemainder(5)

// trailing closures
let names = ["Adam", "Tootie", "Boudreau", "Anne"]
let aNames = filter(names) { (name: String) -> Bool in return name.hasPrefix("A") }
aNames

// example of creating concise code with closures

let students = ["Robert", "Trish", "Carol", "Dennis", "Cole", "Andy"]



// step 4 - shorthand argument names
func filterAndSort4(students: [String]) -> [String] {
    let filtered = filter(students, { count($0) >= 5 })
    return sorted(filtered, { $0 > $1 })
}
filterAndSort4(students)

// step 5 - trailing closure syntax
func filterAndSort5(students: [String]) -> [String] {
    let filtered = filter(students) { count($0) >= 5 }
    return sorted(filtered) { $0 > $1 }
}
filterAndSort5(students)

// step 6 - shorthand operator syntax
func filterAndSort6(students: [String]) -> [String] {
    let filtered = filter(students) { count($0) >= 5 }
    return sorted(filtered, <)
}
filterAndSort6(students)

// step 7 - chaining function calls
func filterAndSort7(students: [String]) -> [String] {
    return filter(students) { count($0) >= 5 }.sorted(>)
}
filterAndSort7(students)