// Playground - noun: a place where people can play

import UIKit


// delegates and data sources
protocol DataSourceProtocol {
    func itemAtIndex(index: Int) -> AnyObject?
}

protocol DelegateProtocol {
    func didSelectItemAtIndex(index: Int)
}

class MyHelper: DataSourceProtocol, DelegateProtocol {
    var items: [AnyObject]
    
    init(items: [AnyObject]) {
        self.items = items
    }
    
    func itemAtIndex(index: Int) -> AnyObject? {
        return index < items.count ? items[index] : nil
    }
    
    // delegate method
    func didSelectItemAtIndex(index: Int) {
        let item: AnyObject = items[index]
        print("You selected \(item)")
    }
}

class Controller {
    weak var helper: MyHelper?
    
    func tapRow(row: Int) {  //pretend this is called when tapping a button
        helper?.didSelectItemAtIndex(row)
    }
    
    func displayRows() {
        let count = helper?.items.count ?? 0
        for i in 0..<count {
            let item: AnyObject = helper?.itemAtIndex(i) ?? ""
            print("item \(i) is \(item)")
        }
    }
}

let helper = MyHelper(items: ["Apple pie", "Bacon", "Vanilla bean", "Milkshake"])
let controller = Controller()
controller.helper = helper

controller.displayRows()
controller.tapRow(2)










