//
//  GuestViewController.swift
//  cpu
//
//  Created by Daniel Risso Elliot on 03/04/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit

class GuestViewController: UIViewController {
    
    @IBAction func back(sender: AnyObject) {
        self.presentController("HomeView")
    }
    
    @IBAction func go(sender: AnyObject) {
        self.presentController("ContentView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }
}
