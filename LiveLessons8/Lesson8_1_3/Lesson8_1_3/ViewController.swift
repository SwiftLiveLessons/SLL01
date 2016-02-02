//
//  ViewController.swift
//  Lesson8_1_3
//
//  Created by BJ on 2/28/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let operationQueue = NSOperationQueue()
    

    @IBAction func synchronousOperation(sender: UIButton) {
        print("synchronous tasks")
        for _ in 1...10 {
            print("a", terminator: "")
        }
        for _ in 1...10 {
            print("b", terminator: "")
        }
        print("")
    }
    
    @IBAction func synchronousTasksInsideAsyncOp(sender: UIButton) {
        print("synchronous tasks inside async operation")
        
        let operation = NSBlockOperation() {
            for _ in 1...10 {
                print("a", terminator: "")
            }
            for _ in 1...10 {
                print("b", terminator: "")
            }
            print("")
        }
        operationQueue.addOperation(operation)
        
    }
    
    @IBAction func asynchronousOperation(sender: UIButton) {
        print("async operations")
        
        let op1 = NSBlockOperation() {
            for _ in 1...10 {
                print("a", terminator: "")
            }
        }
        let op2 = NSBlockOperation() {
            for _ in 1...10 {
                print("b", terminator: "")
            }
            print("")
        }
        operationQueue.addOperation(op1)
        operationQueue.addOperation(op2)
        
    }
    
    @IBAction func asyncWithNestedOp(sender: UIButton) {
        print("nested dispatches")
        
        let op1 = NSBlockOperation() {
            for _ in 1...10 {
                print("a", terminator: "")
            }
        }
        let op2 = NSBlockOperation() {
            for _ in 1...10 {
                print("b", terminator: "")
            }
            print("")
        }
        op2.addDependency(op1)
        
        operationQueue.addOperation(op1)
        operationQueue.addOperation(op2)
        
    }

    
}

