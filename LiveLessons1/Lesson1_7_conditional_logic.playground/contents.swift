// Playground - noun: a place where people can play

import UIKit

let a = 1
let b = 2

if a == b {
    println("a is equal to b")
} else {
    println("a is NOT equal to b")
}

let name = "Saul"

switch name {
    case "Sarah":
    println("matched Sarah")
    case "Molly":
    println("matched Molly")
    case "John":
    println("matched John")
default:
    println("no match")
}

let madeSale = true
let salary = 100_000
let bonus = 5000
let totalPay = madeSale ? salary + bonus : salary