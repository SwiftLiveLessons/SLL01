//
//  ViewController.swift
//  Lesson5Swift
//
//  Created by BJ on 2/27/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var tapCount = 0
    
    private var countableCookies = [Cookie]()
    
    private var cookieCount: Int = 0 {
        didSet {
            resetMultipliersIfNeeded()
            updateDisplay()
        }
    }
    
    @IBOutlet weak var cookieCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func increaseCookieCount(sender: UIButton) {
        if countableCookies.isEmpty {
            ++cookieCount
        } else {
            cookieCount = countableCookies.reduce(cookieCount) { $0 + $1.cookieIntegerValue() }
        }
    }
    
    @IBAction func addCookie(sender: UIButton) {
        let multiplier = Int(arc4random_uniform(5))
        let cookie = Cookie(cookieValue: 1, multiplier: multiplier)
        
        println("adding cookie with \(cookie.cookieIntegerValue()) cookie value")
        
        countableCookies.append(cookie)
    }
    
    private func updateDisplay() {
        cookieCountLabel.text = "\(cookieCount) cookies"
    }
    
    private func resetMultipliersIfNeeded() {
        if tapCount == 10 {
            countableCookies.map { $0.multiplier = nil }
            countableCookies.map { println("multiplier: \($0.multiplier)") }
            tapCount = 0
        } else {
            ++tapCount
        }
    }

}

