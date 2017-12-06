//
//  DREView.swift
//  Class160303
//
//  Created by Daniel Risso Elliot on 03/03/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit

class DREView: UIView {
    func xibSetup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth.union(UIViewAutoresizing.FlexibleHeight)
        addSubview(view)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
            xibSetup()
    }
    
    var view: UIView!
    func loadViewFromNib() -> UIView {
                
                let bundle = NSBundle(forClass: self.dynamicType)
                let nib = UINib(nibName: "CustomView", bundle: bundle)
                
                let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
                return view
    }
    
    
}

