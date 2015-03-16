// Playground - noun: a place where people can play

import UIKit

struct House {
    let address: String
    var pool: Pool?
}

struct Pool {
    let isInGround: Bool
    var deck: Deck?
    func clean() {
        // clean the pool
    }
}

struct Deck {
    let hasSteps: Bool
}

let deck = Deck(hasSteps: true)
var pool = Pool(isInGround: false, deck: nil)
var house = House(address: "123 Main St", pool: pool)

var maybeDeck = house.pool?.deck
house.pool?.deck = deck
house.pool?.deck

let house2 = House(address: "456 Main St", pool: nil)
let poolCleaner: ()? = house2.pool?.clean()
