// Playground - noun: a place where people can play

import UIKit

let a = 1
let b = 2

if a == b {
    print("a is equal to b")
} else {
    print("a is NOT equal to b")
}

let name = "Saul"

switch name {
    case "Sarah":
    print("matched Sarah")
    case "Molly":
    print("matched Molly")
    case "John":
    print("matched John")
default:
    print("no match")
}

let madeSale = true
let salary = 100_000
let bonus = 5000
let totalPay = madeSale ? salary + bonus : salary
