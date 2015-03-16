// Playground - noun: a place where people can play

import UIKit

class Animal {
    let age: Int
    var legs = 0
    
    init(age: Int) {
        self.age = age
    }
}

let animal = Animal(age: 1)


class Dog: Animal {
    let name: String
    let breed: String
    
    init(breed: String, name: String, age: Int) {
        self.breed = breed
        self.name = name
        super.init(age: age)  // delegating up
        legs = 4
    }
}
let dog = Dog(breed: "Chocolate Lab", name: "Frasier", age: 0)
dog.legs


class FailableInit {
    let name: String
    
    init() {
        name = ""
    }
    
    init?(name: String) {
        if name == "Han Solo" {
            self.name = ""
            return nil
        } else {
            self.name = name
        }
    }
}
let hansolo = FailableInit(name: "Han Solo")
let chewie = FailableInit(name: "Chewie")

