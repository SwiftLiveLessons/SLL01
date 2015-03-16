//
//  ViewController.swift
//  Lesson7_6
//
//  Created by BJ on 3/1/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var whatWasDisplayedFromSegue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func exitToViewController(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let sourceVC = segue.sourceViewController as? DetailViewController {
            whatWasDisplayedFromSegue.text = sourceVC.statusLabel.text
        }
    }

}

