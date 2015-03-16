// Playground - noun: a place where people can play

import UIKit

struct SomeStruct {
    var value: Int
}

var a = SomeStruct(value: 5)
var b = a
b.value = 7
a

// properties
struct Player {
    let name: String
    var coins: Int
    mutating func getCoinsFromBank(amount: Int) {
        if amount <= Bank.balance {
            coins += amount
            Bank.balance -= amount
        } else {
            coins += Bank.balance
            Bank.balance = 0
        }
    }
    mutating func quit() {
        Bank.balance += coins
        coins = 0
    }
    var description: String {
        return "Player \(name) has \(coins) coins. Bank has \(Bank.balance) coins."
    }
}

struct Bank {
    static var balance: Int = 10_000
    static func addToBank(amount: Int) {  // no need for "mutating" since this is static, not instance func
        balance += amount
    }
}


var player1 = Player(name: "Franklin", coins: 0)
var player2 = Player(name: "Roosevelt", coins: 0)

player1.getCoinsFromBank(7500)
player1.description

player2.getCoinsFromBank(3000)
player2.description

