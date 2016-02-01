// Playground - noun: a place where people can play

import UIKit

extension Int {
    func doIt(f: () -> ()) {
        for _ in 0..<self {
            f()
        }
    }
}
let five = 5
five.doIt() { print("I am here!") }
3.doIt() { print("I am printing again") }


struct URL {
    let urlString: String
}

extension URL {
    init() {
        self.init(urlString: "http://google.com")
    }
}

let url1 = URL(urlString: "http://wikipedia.org")
let url2 = URL()


extension UIColor {
    class func myFavoriteBlueColor() -> UIColor {
        return UIColor(red: 34.0/255.0, green: 102.0/255.0, blue: 170.0/255.0, alpha: 1.0)
    }
    class func colorWithRGBHex(hex: Int, alpha: Float = 1.0) -> UIColor {
        let r = Float((hex >> 16) & 0xFF) / 255.0 // right-shift by 16 bits
        let g = Float((hex >> 8) & 0xFF) / 255.0 // right-shift by 8 bits
        let b = Float((hex) & 0xFF) / 255.0
        
        return UIColor(red: CGFloat(r), green: CGFloat(g), blue:CGFloat(b), alpha: CGFloat(alpha))
    }
}
UIColor.myFavoriteBlueColor()
UIColor.colorWithRGBHex(0xff4444)

extension URL: CustomStringConvertible {
    var description: String {
        return "The URL is \(urlString)"
    }
}
url1.description
