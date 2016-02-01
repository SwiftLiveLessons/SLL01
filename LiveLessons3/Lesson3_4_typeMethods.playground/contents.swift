// Playground - noun: a place where people can play

import UIKit

func returnMyNameWithFirstAndLast(first: String, last: String) -> String {
    return first + " " + last
}

returnMyNameWithFirstAndLast("BJ", last: "Miller")

class Name {
    func returnMyNameWithFirst(first: String, last: String) -> String {
        return first + " " + last
    }
}

let name = Name()
name.returnMyNameWithFirst("BJ", last: "Miller")


// class methods
class FamousMonument {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    class func theLincolnMemorial() -> FamousMonument {
        return FamousMonument(name: "The Lincoln Memorial")
    }
    
    class func theWW2Memorial() -> FamousMonument {
        return FamousMonument(name: "The WWII Memorial")
    }
    
    class func randomMonument() -> FamousMonument {
        let rnd = arc4random_uniform(2)
        if rnd == 1 {
            return self.theLincolnMemorial()  // can use `self.`
        } else {
            return theWW2Memorial()  // no need to use `self.`
        }
    }
}
let lincoln = FamousMonument.theLincolnMemorial()
let randomMonument = FamousMonument.randomMonument()
