//
//  LoginViewController.swift
//  cpu
//
//  Created by Daniel Risso Elliot on 03/04/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    

    @IBAction func back(sender: AnyObject) {
        self.presentController("HomeView")
    }
    
    @IBAction func go(sender: AnyObject) {
        let ref = Firebase(url: "https://cpu.firebaseio.com")
        ref.authUser("daniel@rissell.me", password: "1234",
                     withCompletionBlock: { error, authData in
                        if error != nil {
                            print("Sucedio un error: " + error.description)
                        } else {
                            self.presentController("ContentView")
                        }
        })
    }
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordField2: UITextField!
    
    @IBAction func singUp(sender: AnyObject) {
        self.presentController("ContentView")
        let ref = Firebase(url: "https://cpu.firebaseio.com")
        if(passwordField.text == passwordField2.text){
            ref.createUser(emailField.text, password: passwordField.text) { (error: NSError!) in
                 if error == nil {
                    ref.authUser(self.emailField.text, password: self.passwordField.text, withCompletionBlock: { (error, auth) -> Void in
                    })
                    self.presentController("ContentView")

                }
            }
        } else {
            passwordField2.backgroundColor?.CIColor.red
        }
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
