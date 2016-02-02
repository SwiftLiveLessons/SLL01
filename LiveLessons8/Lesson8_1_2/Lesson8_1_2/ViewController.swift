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
        print("synchronous tasks")
        for _ in 1...10 {
					// Swift 2 now has only one print statement, vs `print` and `println`. The `terminator` parameter with an empty string will continue printing on the same line without a carriage return.
            print("a", terminator: "")
        }
        for _ in 1...10 {
            print("b", terminator: "")
        }
        print("")
    }
    
    @IBAction func synchronousTasksInsideAsyncOp(sender: UIButton) {
        print("synchronous tasks inside async operation")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            for _ in 1...10 {
                print("a", terminator: "")
            }
            for _ in 1...10 {
                print("b", terminator: "")
            }
            print("")
        }
        // prints abababababababababab
    }

    @IBAction func asynchronousOperation(sender: UIButton) {
        print("async operations")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            for _ in 1...10 {
                print("a", terminator: "")
            }
        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            for _ in 1...10 {
                print("b", terminator: "")
            }
            print("")
        }
    }
    
    @IBAction func asyncWithNestedOp(sender: UIButton) {
        print("nested dispatches")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            for _ in 1...10 {
                print("a", terminator: "")
            }
            dispatch_async(dispatch_get_main_queue()) {
                for _ in 1...10 {
                    print("b", terminator: "")
                }
            }
        }
    }
    
}

