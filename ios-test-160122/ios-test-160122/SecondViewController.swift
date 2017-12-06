//
//  SecondViewController.swift
//  ios-test-160122
//
//  Created by Daniel Risso Elliot on 22/01/16.
//  Copyright © 2016 rissell. All rights reserved.
//


import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myEmail: UITextField!
    @IBOutlet weak var myPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.layer.cornerRadius = 50
    }
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print(textField)
        if textField == myEmail{
            myPassword.becomeFirstResponder()
        } else {
            myPassword.resignFirstResponder()
            loginWasPressed(self)
        }
        return true
    }
    
    func animateTextField(textField: UITextField, up: Bool, withOffset offset:CGFloat){
        let movementDistance : Int = -Int(offset)
        let movementDuration : Double = 0.4
        let movement : Int = (up ? movementDistance : -movementDistance)
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = CGRectOffset(self.view.frame, 0, CGFloat(movement))
        UIView.commitAnimations()
    }
    
    func textFieldDidBeginEditing(textField: UITextField){
        self.animateTextField(textField, up: true, withOffset: textField.frame.origin.y / 2)
    }
    
    func textFieldDidEndEditing(textField: UITextField){
        self.animateTextField(textField, up: false, withOffset: textField.frame.origin.y / 2)
    }
    

    
    @IBAction func loginWasPressed(sender: AnyObject) {
        self.myView.backgroundColor = UIColor.yellowColor()
        
        
    }
}
