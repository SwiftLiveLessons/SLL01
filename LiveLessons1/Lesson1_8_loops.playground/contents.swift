// Playground - noun: a place where people can play

import UIKit

var a = 10

while a > 0 {
    println("a is \(a)")
    --a
}
println()
do {
    println("a is \(a)")
    ++a
} while a < 10

println()


for var i = 0; i < 5; ++i {
    println("i is \(i)")
}
println()
for j in 1...5 {
    println("j is \(j)")
}
