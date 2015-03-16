//
//  ViewController.swift
//  Lesson6_2
//
//  Created by BJ on 2/22/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        println("init(coder:). button is \(button)")
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        println("init(nibName:bundle:)")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init() {
        println("init()")
        super.init()
    }
    
    override func viewDidLoad() {
        println("viewDidLoad()")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        println("viewWillAppear(animated:). button is \(button)")
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        println("viewWillLayoutSubviews()")
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        println("viewDidLayoutSubviews()")
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(animated: Bool) {
        println("viewDidAppear(animated:)")
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        println("viewWillDisappear(animated:)")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        println("viewDidDisappear(animated:)")
        super.viewDidDisappear(animated)
    }
    
    deinit {
        println("deinitializing")
    }

    override func didReceiveMemoryWarning() {
        println("didReceiveMemoryWarning()")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

