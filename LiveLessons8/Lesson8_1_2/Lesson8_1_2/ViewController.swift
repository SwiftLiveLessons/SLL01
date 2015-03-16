//
//  ViewController.swift
//  Lesson8_1_2
//
//  Created by BJ on 2/25/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        

    
    }

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
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            for _ in 1...10 {
                print("a")
            }
            for _ in 1...10 {
                print("b")
            }
            println()
        }
        // prints abababababababababab
    }

    @IBAction func asynchronousOperation(sender: UIButton) {
        println("async operations")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            for _ in 1...10 {
                print("a")
            }
        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            for _ in 1...10 {
                print("b")
            }
            println()
        }
    }
    
    @IBAction func asyncWithNestedOp(sender: UIButton) {
        println("nested dispatches")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            for _ in 1...10 {
                print("a")
            }
            dispatch_async(dispatch_get_main_queue()) {
                for _ in 1...10 {
                    print("b")
                }
            }
        }
    }
    
}

