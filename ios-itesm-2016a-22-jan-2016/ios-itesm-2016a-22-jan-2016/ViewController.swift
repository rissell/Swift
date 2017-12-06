//
//  ViewController.swift
//  ios-itesm-2016a-22-jan-2016
//
//  Created by miguelicious on 1/22/16.
//  Copyright © 2016 miguelicious. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var marButton: UIButton!
    @IBOutlet weak var marView1: UIView!
    @IBOutlet weak var marVerticalConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressMe(sender: AnyObject) {
        print("Button was pressed")
        marButton.setTitle("Already Pressed", forState: UIControlState.Normal)

        
        marVerticalConstraint.constant = 100
        
        UIView.animateWithDuration(2, animations: {
            self.marView1.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            self.marButton.backgroundColor = UIColor(red: 200.0/255.0, green: 100.0/255.0, blue: 55.0/255.0, alpha: 1)
            self.view.layoutIfNeeded()
        })
    }
}

