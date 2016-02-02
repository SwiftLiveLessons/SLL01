//
//  SalesStaffViewController.swift
//  Lesson6_4
//
//  Created by BJ on 3/7/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit
import CoreData

class SalesStaffViewController: UIViewController, UITableViewDataSource {

    var salesStaff: [SalesPerson]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberOfStaff: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfStaff.text = "\(salesStaff?.count ?? 0) staff members"
    }
    
    // MARK: table view data source methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SalesPersonCell", forIndexPath: indexPath) 
        
        let salesPerson = salesStaff?[indexPath.row]
        cell.textLabel?.text = salesPerson?.name ?? ""
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return salesStaff?.count ?? 0
    }
}
