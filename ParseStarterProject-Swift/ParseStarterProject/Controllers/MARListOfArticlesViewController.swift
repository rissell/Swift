//
//  MARListOfArticlesViewController.swift
//  iOSitesm2016
//
//  Created by miguelicious on 2/15/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class MARListOfArticlesViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("I am inside the list of articles")
        let nib = UINib(nibName: "MARArticlesCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MARArticlesCell
        cell.marLabel.text = "This is going to be a description"
        return cell
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var objectCount = 0
        let query = PFQuery(className: "Articles")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) articles.")
                if let objects = objects {
                    for object in objects {
                        print(object.objectId)
                    }
                }
                objectCount = objects!.count
            } else {
                // Log details of the failure
                print("Error: \(error!) ")
                objectCount = 0
            }
        }
        return objectCount
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 170
    }

}
