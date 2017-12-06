//
//  ViewController.swift
//  ios-160125
//
//  Created by Daniel Risso Elliot on 25/01/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let bestFriends: [String] = ["John", "Juan"]

    let friends: [String] = ["Anna", "Maria", "Judith", "Fer"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("First View")
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bestFriends.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        
        
        return cell
    }
}