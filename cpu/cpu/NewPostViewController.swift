//
//  NewPostViewController.swift
//  cpu
//
//  Created by Daniel Risso Elliot on 27/04/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit
import Firebase

class NewPostViewController: UIViewController {

    @IBOutlet weak var headerPost: UITextField!
    @IBOutlet weak var contentPost: UITextView!
    @IBOutlet weak var importantPost: UISwitch!
    @IBOutlet weak var privetePost: UISwitch!
    
    
    let ref = Firebase(url: "https://cpu.firebaseio.com")
    
    @IBAction func cancelPost(sender: AnyObject) {
    
        self.presentController("ContentView")
        
    }
    
    @IBAction func savePost(sender: AnyObject) {
        if(contentPost.text! != "" && headerPost.text! != ""){
            let postItem = PostItem(content: contentPost.text!, header:headerPost.text!, important:importantPost.on, privacy:privetePost.on)
            let postItemRef = self.ref.childByAutoId()
            postItemRef.setValue(postItem.toAnyObject())
            headerPost.text! = "";
            contentPost.text! = "";
            importantPost.on = false;
            privetePost.on = false;
            self.presentController("ContentView")
        } else {
            var alert = UIAlertController(title: "Post Item",  message: "Please write header and content", preferredStyle: .Alert)
            let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction) -> Void in
                let textField = alert.textFields![0]
                let postItem = PostItem(content: textField.text!, header: "160423",important: false, privacy: false)
                let postItemRef = self.ref.childByAutoId()
                postItemRef.setValue(postItem.toAnyObject())
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction) -> Void in
            
            }
            alert.addTextFieldWithConfigurationHandler {(textField: UITextField!) -> Void in }
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }
    
}
