// Playground - noun: a place where people can play

import UIKit

func funcTakesString(str: String) {
    println(str)
}

func funcTakesNSString(str: NSString) {
    println(str)
    funcTakesString(str as String)
}

let nsstr: NSString = "I am an NSString"
funcTakesNSString(nsstr)
println()

funcTakesString(nsstr as String)

func funcTakesInt(num: Int) {
    println("\(num)")
}

let nsnum: NSNumber = NSNumber(integer: 42)
funcTakesInt(nsnum.integerValue)

println()


// dictionary
let nsDict = NSDictionary(objects: [365, 52, "Saturday"], forKeys: ["daysInYear", "weeksInYear", "bestDayOfWeek"])
println(nsDict)

let swiftDict = nsDict as! [String : AnyObject]
swiftDict["daysInYear"]

let nsDict2 = swiftDict as NSDictionary

println()

// NSArray and Array
let nsArr = NSArray(objects: 365, 52, "Saturday")
println(nsArr)

let swiftArray = nsArr as! [AnyObject]
swiftArray[2]

let nsArr2 = swiftArray as NSArray


// NSSet and Set
let nsSet = NSSet(array: ["Apples", "Oranges", "Pairs", 42])
println(nsSet)

let swiftSet = nsSet as Set
swiftSet.first

let nsset2 = swiftSet as NSSet

