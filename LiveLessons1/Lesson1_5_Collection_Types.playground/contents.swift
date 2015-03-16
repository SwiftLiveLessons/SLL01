// Playground - noun: a place where people can play

import UIKit

// Arrays
var array1: [String] = []
var array2 = [String]()

var array3: Array<String> = ["Bonjour", "Ciao"]

array3[0]
array3.last

array3.removeAll(keepCapacity: true)

array3 += ["bread", "milk", "eggs"]
array3.removeAtIndex(0)
array3

array3.isEmpty

// Dictionary
var dict = [String : Double]()
var dict2: [String : Double] = [:]
var dict3: Dictionary<String, Double> = [:]

dict["pi"] = 3.14
dict.updateValue(9.8, forKey: "gravity")
dict.updateValue(9.7, forKey: "gravity")

dict.removeAll(keepCapacity: false)

dict.isEmpty

// Sets
var set = Set<String>()
set.insert("halloo")
set.count
set.debugDescription
set.contains("halloo")
set.contains("hello")

var words: Set<String> = ["Bye", "Ciao", "Au revior"]

words.isEmpty
words.removeFirst()
words

// Set operators
let odd = Set([1, 3, 5, 5, 7])
let even = Set([2, 4, 6, 8])

odd.union(even)
odd.isDisjointWith(even)

let firstTen = Set(1...10)
let oddToTwenty = Set([1, 3, 5, 7, 9, 11, 13, 15, 17, 19])
let oddToTen = firstTen.intersect(oddToTwenty)

odd.isSubsetOf(firstTen)
odd.isSubsetOf(even)
oddToTwenty.isSupersetOf(even)
oddToTwenty.isSupersetOf(odd)
oddToTwenty.isSupersetOf(firstTen)
