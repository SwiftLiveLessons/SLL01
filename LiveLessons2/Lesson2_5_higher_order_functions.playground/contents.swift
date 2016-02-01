// Playground - noun: a place where people can play

import UIKit

func speedUp(speed: Int) -> Int {
    return speed + 1
}
func slowDown(speed: Int) -> Int {
    return speed - 1
}
func changeSpeed(speed: Int) -> ( (Int) -> Int ) {
    return speed > 65 ? slowDown : speedUp
}

var currentSpeed = 55
while currentSpeed != 65 {
    let speedFunc = changeSpeed(currentSpeed)
    currentSpeed = speedFunc(currentSpeed)
    print("speed is now \(currentSpeed)")
}
print("speed is now \(currentSpeed)")
