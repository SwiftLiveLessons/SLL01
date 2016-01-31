// Playground - noun: a place where people can play

import UIKit

var a = 10

while a > 0 {
    print("a is \(a)")
    --a
}
print("")

//: From Swift 2 __do__ has a new meaning ([documentation](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Statements.html#//apple_ref/doc/uid/TP40014097-CH33-ID533))
repeat {
    print("a is \(a)")
    ++a
} while a < 10

print("")


for var i = 0; i < 5; ++i {
    print("i is \(i)")
}
print("")
for j in 1...5 {
    print("j is \(j)")
}
