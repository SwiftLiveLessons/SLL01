// Playground - noun: a place where people can play

import UIKit

var a = 5

//: [This notation will be removed in Swift 3](https://github.com/apple/swift-evolution/blob/master/proposals/0004-remove-pre-post-inc-decrement.md)
++a 
a++
a

var b = 9
let c = a * b

let remainder = 8.0 % 2.5

false || true
true && false
!true
!false

if b == 9 {
    print("b is 9")
} else {
    print("b is not 9")
}

if b == 9 || c == 60 {
    print("b is 9 and c is 63")
}

//  closed range
for index in 1...5 {
    print("Hi")
}
