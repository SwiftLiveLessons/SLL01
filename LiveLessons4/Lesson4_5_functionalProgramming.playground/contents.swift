// Playground - noun: a place where people can play

import UIKit

// map
extension String {
    var asArray: [Character] {
        return self.characters.map { $0 }
    }
}
"Fido".asArray
"hôpital".asArray

// reduce
let transactions = [1.99, 5.74, 12.63, 21.40]
let roundedUpSavings = transactions.reduce(0.0) { $0 + (ceil($1) - $1) }
roundedUpSavings

// filter
let doubleDigits = transactions.filter { $0 >= 10.0 }
doubleDigits

// currying
func regularAdd(n1: Int, n2: Int, n3: Int) -> Int {
    return n1 + n2 + n3
}

func curriedAdd(n1: Int)(n2: Int)(n3: Int) -> Int {
    return n1 + n2 + n3
}
let firstCurry = curriedAdd(1)
let secondCurry = firstCurry(n2: 2)
let thirdCurry = secondCurry(n3: 3)


// operators
func fmap<T, U>(f: T -> U, value: T?) -> U? {
    switch value {
    case .Some(let x): return f(x)
    case .None: return .None
    }
}
let superCount = fmap({ $0.characters.count }, value: "Supercalifragilisticexpialidocious")
superCount

infix operator <^> { associativity left }
func <^><T, U>(f: T -> U, value: T?) -> U? {
    return value.map(f)
}
let superCount2 = { $0.characters.count } <^> "Supercalifragilisticexpialidocious"
superCount2

// apply
func apply<T, U>(f: (T -> U)?, value: T?) -> U? {
    switch f {
    case .Some(let fx): return fx <^> value
    case .None: return .None
    }
}
func anotherAdd(n1: Int) -> (Int -> Int) {
    return { n2 in  n1 + n2 }
}
let applySum = apply(fmap(anotherAdd, value: 5), value: 7)
applySum

infix operator <*> { associativity left }
func <*><T, U>(f: (T -> U)?, value: T?) -> U? {
    return apply(f, value: value)
}
let fsum = anotherAdd <^> 5 <*> 7
fsum

// bind/flatMap
func bind<T, U>(value: T?, f: T -> U?) -> U? {
    switch value {
    case .Some(let x): return f(x)
    case .None: return .None
    }
}
infix operator >>- { associativity left precedence 150 }
func >>-<T, U>(value: T?, f: T -> U?) -> U? {
    return bind(value, f: f)
}

func JSONString(object: AnyObject) -> String? {
    return object as? String
}
func JSONInt(object: AnyObject) -> Int? {
    return object as? Int
}

let json = ["bankName" : "Chase"]
let bankName = json["bankName"] >>- JSONString
let nilName = json["someOtherKey"] >>- JSONString


struct Person {
    let name: String
    let heightInInches: Int
    let favoriteSong: String
    
    var heightString: String {
        let feet = heightInInches / 12
        let inches = heightInInches % 12
        return "\(feet) ft \(inches) in"
    }
    
    static func create(name: String, heightInInches: Int, favoriteSong: String) -> Person {
        return Person(name: name, heightInInches: heightInInches, favoriteSong: favoriteSong)
    }
}

func curry<A, B, C, D>(f: (A, B, C) -> D) -> A -> B -> C -> D {
    return { a in { b in { c in f(a, b, c) }}}
}

let jsonString = "{\"name\":\"BJ\",\"heightInInches\":77,\"favoriteSong\":\"Anna Molly\"}"
let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)

if let unwrappedJsonData = jsonData {
    let json: AnyObject? = try NSJSONSerialization.JSONObjectWithData(unwrappedJsonData, options: .MutableContainers)

    let name = json?["name"] >>- JSONString
    let heightInInches = json?["heightInInches"] >>- JSONInt
    let favoriteSong = json?["favoriteSong"] >>- JSONString
    
    let person = curry <^> Person.create <*> name <*> heightInInches <*> favoriteSong
    
    person?.heightString
}











