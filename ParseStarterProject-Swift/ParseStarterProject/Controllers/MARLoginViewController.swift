//
//  MARLoginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by miguelicious on 2/4/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class MARLoginViewController: UIViewController {

    @IBOutlet weak var marEmail: UITextField!
    @IBOutlet weak var marPassword: UITextField!
    
    
    @IBOutlet weak var marLogin: UIButton!
    @IBOutlet weak var marSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marLogin.layer.borderWidth = 1
        marLogin.layer.borderColor = UIColor.whiteColor().CGColor
        
        marSignUp.layer.borderWidth = 1
        marSignUp.layer.borderColor = UIColor.whiteColor().CGColor
        
        marEmail.text = "aramis001@gmail.com"
        marPassword.text = "Password123"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginWasPressed(sender: AnyObject) {
        if marEmail.text != "" && marPassword.text != "" {
            PFUser.logInWithUsernameInBackground(marEmail.text!, password: marPassword.text!, block: { (user: PFUser?, error: NSError?) -> Void in
                if error == nil {
                    print("user logged in successfully")
                    self.presentController("NavigationController")
                } else {
                    print(error)
                }
            })
        }
    }
    
    @IBAction func signupWasPressed(sender: AnyObject) {
        if marEmail.text != "" && marPassword.text != "" {
            let user = PFUser()
            user.username = marEmail.text
            user.email = marEmail.text
            user.password = marPassword.text
            
            user.signUpInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                if success {
                    print("User signed up successfully")
                } else {
                    print(error)
                }
            })
        }
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }

}

extension MARLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == marEmail {
            marPassword.becomeFirstResponder()
        } else {
            loginWasPressed(self)
        }
        return true
    }
}
