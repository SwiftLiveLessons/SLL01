// Playground - noun: a place where people can play

import UIKit

func funcTakesString(str: String) {
    print(str)
}

func funcTakesNSString(str: NSString) {
    print(str)
    funcTakesString(str as String)
}

let nsstr: NSString = "I am an NSString"
funcTakesNSString(nsstr)
print("")

funcTakesString(nsstr as String)

func funcTakesInt(num: Int) {
    print("\(num)")
}

let nsnum: NSNumber = NSNumber(integer: 42)
funcTakesInt(nsnum.integerValue)

print("")


// dictionary
let nsDict = NSDictionary(objects: [365, 52, "Saturday"], forKeys: ["daysInYear", "weeksInYear", "bestDayOfWeek"])
print(nsDict)

let swiftDict = nsDict as! [String : AnyObject]
swiftDict["daysInYear"]

let nsDict2 = swiftDict as NSDictionary

print("")

// NSArray and Array
let nsArr = NSArray(objects: 365, 52, "Saturday")
print(nsArr)

// Swift 2 now does not require the as! force cast operator
let swiftArray = nsArr as [AnyObject]
swiftArray[2]

let nsArr2 = swiftArray as NSArray


// NSSet and Set
let nsSet = NSSet(array: ["Apples", "Oranges", "Pairs", 42])
print(nsSet)

let swiftSet = nsSet as Set
swiftSet.first

let nsset2 = swiftSet as NSSet

