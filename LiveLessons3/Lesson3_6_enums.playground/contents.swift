// Playground - noun: a place where people can play

import UIKit

enum ColorsOfRainbow {
    case Red
    case Orange, Yellow, Green, Blue, Indigo, Violet
}

var myColor = ColorsOfRainbow.Red
myColor = .Yellow


enum MacOSXNames: String {
    case Cheetah      = "10.0"
    case Puma         = "10.1"
    case Jaguar       = "10.2"
    case Panther      = "10.3"
    case Tiger        = "10.4"
    case Leopard      = "10.5"
    case SnowLeopard  = "10.6"
    case Lion         = "10.7"
    case MountainLion = "10.8"
    case Mavericks    = "10.9"
    case Yosemite     = "10.10"
    
    mutating func setToCheetah() {
        self = .Cheetah
    }
    
    static func mostRecentCat() -> MacOSXNames {
        return .MountainLion
    }
}
var currentVersion: MacOSXNames = .Mavericks
currentVersion.rawValue

// 1 year passes
if let yosemite = MacOSXNames(rawValue: "10.10") {
    currentVersion = yosemite
}
currentVersion.rawValue

currentVersion.setToCheetah()
currentVersion.rawValue

let mostRecentCat = MacOSXNames.mostRecentCat()
mostRecentCat.rawValue


myColor = .Orange
switch myColor {
case .Blue, .Green:
    print("Blue or green is my favorite color")
case .Red:
    print("Red kitchens make me hungry")
default:
    print("I don't like whatever color this is")
}
