//
//  ContentViewController.swift
//  cpu
//
//  Created by Daniel Risso Elliot on 21/04/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit
import Firebase

class ContentViewController: UIViewController {
    
    @IBOutlet weak var rigthLabel: UITableView!
    
    @IBOutlet weak var tittleLabel: UITableView!
    @IBOutlet weak var contentLabel: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let cpuRef = Firebase(url:"https://cpu.firebaseio.com")
        cpuRef.observeEventType(.Value, withBlock: { snapshot in
                print(snapshot.value)
                var posts = snapshot.value
            }, withCancelBlock: { error in
                print(error.description)
        })

    }

}