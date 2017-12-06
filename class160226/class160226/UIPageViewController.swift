//
//  UIPageViewController.swift
//  class160226
//
//  Created by Daniel Risso Elliot on 29/02/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit

enum DREAvaibleDetailsControllers: Int {
    case DREDialVC, DREProtocolVC, DREGraphVC
    func toString() -> String {
        let controllers: [String] = ["DREDialViewController", "DREProtocolViewController", "DREGraphViewController"]
        return controllers[self.rawValue]
    }
}

class DREUIPageViewController: UIPageViewController {

    var dreNavTitle: String = ""
    var controllers: [String] = ["DREDialViewController", "DREProtocolViewController", "DREGraphViewController"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: <#T##UIImage#>)
        
        
    }

    
    var gestureRecognizers: [UIGestureRecognizer] {
        
    }

}
