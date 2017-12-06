//
//  MARView.swift
//  iOS ITESM 2016 Mar 3
//
//  Created by Miguel Ramirez on 3/3/16.
//  Copyright © 2016 Miguel Ramirez. All rights reserved.
//

import UIKit

class MARView: UIView {
    
    // Our custom view from the XIB file
    var view: UIView!
    var drawStar: Bool = true {
        didSet {
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()
    }
    
    func xibSetup() {
        
        self.backgroundColor = UIColor.redColor()
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth.union(UIViewAutoresizing.FlexibleHeight) // Updating for Swift 2.0
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "MARView", bundle: bundle)
        
        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }

    override func drawRect(rect: CGRect) {

        let numberOfRectangles = 3
        let numberOfCircles = 8
        
        for(var i = 0; i<numberOfCircles; i++){
            let ovalPath = UIBezierPath(ovalInRect: CGRectMake(0, self.bounds.size.height / CGFloat(numberOfCircles)*CGFloat(i), self.bounds.size.width / CGFloat(numberOfCircles), self.bounds.size.height / CGFloat(numberOfCircles)))
            UIColor.grayColor().setFill()
            ovalPath.fill()
            


        }
        
        for(var i = 0; i<numberOfRectangles; i++){
    
            
            let rectangleRec = CGRect(x: self.bounds.size.width / CGFloat(numberOfCircles), y: self.bounds.size.height / CGFloat(numberOfRectangles)*CGFloat(i), width: self.bounds.size.width / CGFloat(numberOfRectangles), height: self.bounds.size.height / CGFloat(numberOfRectangles))
            let rectanglePath = UIBezierPath(rect: rectangleRec)
            UIColor.grayColor().setFill()
            rectanglePath.fill()
            
        }
        
//        //// Rectangle Drawing
//        let rectangleRec = CGRect(x: self.bounds.size.width / 2, y: 0, width: self.bounds.size.width / 2, height: self.bounds.size.height / 2)
//        let rectanglePath = UIBezierPath(rect: rectangleRec)
//        UIColor.grayColor().setFill()
//        rectanglePath.fill()
//        
//        //// Oval Drawing
//        let ovalPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, self.bounds.size.width / 2, self.bounds.size.width / 2))
//        UIColor.grayColor().setFill()
//        ovalPath.fill()
//        
//        //// Rectangle Drawing
//        let rectangleRec2 = CGRect(x: 0, y: self.bounds.size.width / 2, width: self.bounds.size.width / 2, height: self.bounds.size.height / 2)
//        let rectanglePath2 = UIBezierPath(rect: rectangleRec2)
//        UIColor.grayColor().setFill()
//        rectanglePath2.fill()
//        
//        //// Oval Drawing
//        let ovalPath2 = UIBezierPath(ovalInRect: CGRectMake(self.bounds.size.width / 2, self.bounds.size.width / 2, self.bounds.size.width / 2, self.bounds.size.width / 2))
//        UIColor.grayColor().setFill()
//        ovalPath2.fill()
        
    }


}












