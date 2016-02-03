// Playground - noun: a place where people can play

import UIKit

enum Result {
    case Error(NSError)   // left
    case Value(String)    // right
}

func getJSONFromURL(url: NSURL) -> Result {
    return .Value("{\"HTTPStatusCode\":200}")
}

let success = getJSONFromURL(NSURL(string: "http://httpbin.org/get")!)
let failure = Result.Error(NSError(domain: "HTTP Domain", code: 400, userInfo: [NSLocalizedDescriptionKey : "Bad request"]))

switch failure {
case .Error(let error):
    print("error: \(error.localizedDescription), code: \(error.code)")
case .Value(let response):
    print("response: \(response)")
}


class Box<T> {
    var value: T
    init(_ value: T) { self.value = value }
}

enum GenericResult<T> {
    case Error(NSError)
    case Value(Box<T>)
}

let intResult = GenericResult.Value(Box(5))

switch intResult {
case .Value(let intBox):
    let intValue = intBox.value
    print("intValue is \(intValue)")
case .Error(let error):
    print("error is \(error.localizedDescription)")
}

let stringResult = GenericResult.Value(Box("json result"))
switch stringResult {
case .Value(let stringBox):
    let stringValue = stringBox.value
    print("stringValue is \(stringValue)")
case .Error(let error):
    print("error is \(error.localizedDescription)")
}
