// Playground - noun: a place where people can play

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    let items = ["Uno", "Dos", "Tres", "Cuatro"]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        cell.contentView.backgroundColor = UIColor.orangeColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Spanish Numbers"
    }
}

let ds = DataSource()
let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 568), style: .Plain)
tableView.dataSource = ds
tableView.reloadData()

class Delegate: NSObject, UITableViewDelegate {
    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88.0
    }
}
let del = Delegate()
tableView.delegate = del
tableView.reloadData()