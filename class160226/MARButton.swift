//
//  MARButton.swift
//  class160226
//
//  Created by Daniel Risso Elliot on 26/02/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit

@IBDesignable class MARButton: UIButton {
    @IBInspectable var backColor: UIColor = UIColor.clearColor() {
        didSet {
            self.backgroundColor = backColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

}
