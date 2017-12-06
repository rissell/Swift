//
//  ViewController.swift
//  ios-test-160122
//
//  Created by Daniel Risso Elliot on 22/01/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dreButton: UIButton!
    @IBOutlet weak var dreView: UIView!
    @IBOutlet weak var dreVerticalConstrain: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressMe(sender: AnyObject) {
        print("Hola")
        dreButton.setTitle("Pressed", forState: UIControlState.Normal)
        dreButton.backgroundColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1)
        dreVerticalConstrain.constant = 100
        UIView.animateWithDuration(2, animations: {
            self.view.layoutIfNeeded()
        })
        
    }


}

