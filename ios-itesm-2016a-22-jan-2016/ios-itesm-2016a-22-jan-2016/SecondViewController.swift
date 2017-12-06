//
//  SecondViewController.swift
//  ios-itesm-2016a-22-jan-2016
//
//  Created by miguelicious on 1/22/16.
//  Copyright © 2016 miguelicious. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var marView: UIView!
    @IBOutlet weak var marEmail: UITextField!
    @IBOutlet weak var marPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marView.layer.cornerRadius = 50
        marEmail.text = "miguel@miguel.com"
        marPassword.text = "password"
    }
    
    @IBAction func loginWasPressed(sender: AnyObject) {
        if marEmail.text != "" && marPassword.text != "" {
            self.presentController("NavigationController")
        } else {
            let alert = UIAlertController(title: "Oooops", message: "Email and/or password cannot be empty", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func presentController(controllerId: String!) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(controllerId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }
    
}

// MARK: UITextFieldDelegate Implementation
extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == marEmail {
            marPassword.becomeFirstResponder()
        } else {
            marPassword.resignFirstResponder()
            loginWasPressed(self)
        }
        return true
    }
}
