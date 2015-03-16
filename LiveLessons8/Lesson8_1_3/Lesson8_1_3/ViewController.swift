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
        println("synchronous tasks")
        for _ in 1...10 {
            print("a")
        }
        for _ in 1...10 {
            print("b")
        }
        println()
    }
    
    @IBAction func synchronousTasksInsideAsyncOp(sender: UIButton) {
        println("synchronous tasks inside async operation")
        
        let operation = NSBlockOperation() {
            for _ in 1...10 {
                print("a")
            }
            for _ in 1...10 {
                print("b")
            }
            println()
        }
        operationQueue.addOperation(operation)
        
    }
    
    @IBAction func asynchronousOperation(sender: UIButton) {
        println("async operations")
        
        let op1 = NSBlockOperation() {
            for _ in 1...10 {
                print("a")
            }
        }
        let op2 = NSBlockOperation() {
            for _ in 1...10 {
                print("b")
            }
            println()
        }
        operationQueue.addOperation(op1)
        operationQueue.addOperation(op2)
        
    }
    
    @IBAction func asyncWithNestedOp(sender: UIButton) {
        println("nested dispatches")
        
        let op1 = NSBlockOperation() {
            for _ in 1...10 {
                print("a")
            }
        }
        let op2 = NSBlockOperation() {
            for _ in 1...10 {
                print("b")
            }
            println()
        }
        op2.addDependency(op1)
        
        operationQueue.addOperation(op1)
        operationQueue.addOperation(op2)
        
    }

    
}

