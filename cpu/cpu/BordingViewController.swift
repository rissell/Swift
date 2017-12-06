//
//  BordingViewController.swift
//  cpu
//
//  Created by Daniel Risso Elliot on 04/05/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit

class BordingViewController: UIViewController {

    @IBAction func leftSwipe(sender: AnyObject) {
         self.presentController("ContentView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
