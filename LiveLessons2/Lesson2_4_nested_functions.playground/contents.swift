// Playground - noun: a place where people can play

import UIKit

func combineNumbers(numbers: Int...) -> Int {
    var result = 0
    
    func _add(num1: Int, toNum num2: Int) -> Int {
        return num1 + num2
    }
    
    for number in numbers {
//        result = _add(result, toNum: number)
        result = _add(result, toNum: number)
    }
    
    return result
}
combineNumbers(2, 4, 6, 8, 10)


func combineNumbers2(numbers: Int...) -> Int {
    var result = 0
    
    func _add(num1: Int, toNum num2: Int) -> Int {
        
        func nestedAdd() -> Int {
            return num1 + num2
        }
        
        return nestedAdd()
    }
    
    for number in numbers {
        result = _add(result, toNum: number)
    }
    
    return result
}
combineNumbers2(2, 4, 6, 8, 10)