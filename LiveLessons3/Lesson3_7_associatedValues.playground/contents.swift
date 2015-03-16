// Playground - noun: a place where people can play

import UIKit

enum Result {
    case Success(String)
    case Error(String, Int)
}

func fakeNetworkCall() -> Result {
    let rnd = arc4random_uniform(4)
    if rnd == 0 {
        return Result.Success("some JSON string")
    } else if rnd == 1 {
        return Result.Error("Bad request", 400)
    } else if rnd == 2 {
        return .Error("short and stout", 418)
    } else {
        return Result.Error("Unauthorized", 401)
    }
}

let networkResult = fakeNetworkCall()
switch networkResult {
case .Success(let json):
    println("json is \(json)")
case .Error(_, let errorCode) where errorCode == 400:
    println("Code: \(errorCode)")
case .Error(let errorString, let errorCode) where errorCode == 418:
    println("I'm a little teapot, \(errorString). http://tools.ietf.org/html/rfc2324.")
default:
    println("Unknown error")
}