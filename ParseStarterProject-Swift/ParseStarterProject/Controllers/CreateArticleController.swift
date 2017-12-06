//
//  CreateArticleController.swift
//  iOSitesm2016
//
//  Created by miguelicious on 2/8/16.
//  Copyright © 2016 Parse. All rights reserved.
//  URL: http://ios-class-itesm-2016a.s3.amazonaws.com/iOS-itesm-Feb15-starter.zip
//

import UIKit
import Parse
import KVNProgress

class CreateArticleController: UIViewController {
    
    @IBOutlet weak var marDescription: UITextField!
    @IBOutlet weak var marImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cameraWasPressed(sender: AnyObject) {
        // Implement an AlertController
        let optionMenu = UIAlertController(title: nil, message: "Choose an option", preferredStyle: .ActionSheet)
        
        let cameraAction = UIAlertAction(title: "Use camera", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.pickMediaFromSource(UIImagePickerControllerSourceType.Camera)
        })
        
        let picturesAction = UIAlertAction(title: "Use your photos", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.pickMediaFromSource(UIImagePickerControllerSourceType.PhotoLibrary)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(cameraAction)
        optionMenu.addAction(picturesAction)
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    
    @IBAction func saveWasPressed(sender: AnyObject) {
        if marImage.image != nil && marDescription.text != "" {
              [KVNProgress, show];
            let imageData = UIImageJPEGRepresentation(self.marImage.image!, 1.0)
            let imageFile = PFFile(name: "DinningTable", data: imageData!)
            
            let object = PFObject(className: "Articles")
            object["owner"] = PFUser.currentUser()
            object["image"] = imageFile
            object["description"] = self.marDescription.text
            
            // Homework for Aramis. Create a video to display a KVNProgress
            // Start KVNProgress here
            object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print(success)
                if success == true {
                    // KVNProgress success here
                    let alertController = UIAlertController(title: "Success!", message: "Your article has been saved successfully!", preferredStyle: .Alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        
                    }
                    alertController.addAction(OKAction)
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                } else {
                    // KVNProgress error here
                    
                }
            }
        } else {
            let alertController = UIAlertController(title: "Oops!", message: "You need to select an image and put a description for an article.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
}

extension CreateArticleController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func pickMediaFromSource(source: UIImagePickerControllerSourceType) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = source
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.marImage.image = image
    }
    
}
