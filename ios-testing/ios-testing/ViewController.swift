//
//  ViewController.swift
//  ios-testing
//
//  Created by Daniel Risso Elliot on 13/01/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var Label1: UILabel!
    
    @IBAction func leftSwipe(sender: UISwipeGestureRecognizer) {
        Label1.text = "Left Swipe"
    }
   
    @IBAction func rigthSwipe(sender: UISwipeGestureRecognizer) {
        Label1.text = "Rigth Swipe"
    }
    @IBAction func pressed(sender: AnyObject) {
        print("Pressed")
        Label1.text = "Hola"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

