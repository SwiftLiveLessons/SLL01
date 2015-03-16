//
//  ViewController.swift
//  Lesson7_1_storyboards
//
//  Created by BJ on 3/1/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderChanged(sender: UISlider) {
        myLabel.text = "\(sender.value)"
    }

    @IBAction func resetButtonTapped(sender: UIButton) {
        myLabel.text = "I reset you!"
    }
}

