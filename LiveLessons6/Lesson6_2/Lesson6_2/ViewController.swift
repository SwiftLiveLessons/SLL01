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
    
    required init?(coder aDecoder: NSCoder) {
        print("init(coder:). button is \(button)")
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        print("init(nibName:bundle:)")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init() {
        print("init()")
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        print("viewDidLoad()")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear(animated:). button is \(button)")
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews()")
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews()")
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(animated: Bool) {
        print("viewDidAppear(animated:)")
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("viewWillDisappear(animated:)")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("viewDidDisappear(animated:)")
        super.viewDidDisappear(animated)
    }
    
    deinit {
        print("deinitializing")
    }

    override func didReceiveMemoryWarning() {
        print("didReceiveMemoryWarning()")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

