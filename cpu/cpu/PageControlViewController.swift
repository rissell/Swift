//
//  PageControlViewController.swift
//  cpu
//
//  Created by Daniel Risso Elliot on 04/05/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController {
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
      //  self.pageTitles = NSArray(objects: "Copy", "Paste", "Use")
        
       // self.pageImages = NSArray(objects: "Copy", "Paste", "Use")
       // self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
       // self.pageViewController.dataSource = self
        
        
      //  var startVC = self.viewControllerAtIndex(0) as ContentPageViewController
        
      //  var viewControllers = NSArray(object: startVC)
        
        
        
      //  self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        
        
      //  self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 60)
        
        
        
       // self.addChildViewController(self.pageViewController)
        
       // self.view.addSubview(self.pageViewController.view)
        
       // self.pageViewController.didMoveToParentViewController(self)
        
    }
    
  //  @IBAction func restartAction(sender: AnyObject){
        
    //    var startVC = self.viewControllerAtIndex(0) as ContentPageViewController
        
      //  var viewControllers = NSArray(object: startVC)
        
        
        
     //   self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: .Forward, animated: true, completion: nil)
        
   // }

    
   // func viewControllerAtIndex(index: Int) -> ContentPageViewController{
        
      //  if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            
       //     return ContentPageViewController()
       // }
       // var vc: ContentPageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentPageViewController") as! ContentPageViewController
       // vc.imageFile = self.pageImages[index] as! String
       // vc.titleText = self.pageTitles[index] as! String
       // vc.pageIndex = index
        
       // return vc
   // }
    
   // func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
        
   // {
        
        
        
      //  var vc = viewController as! ContentPageViewController
        
      //  var index = vc.pageIndex as Int
        
        
        
        
        
      //  if (index == 0 || index == NSNotFound)
            
       // {
            
         //   return nil
            
            
            
       // }
        
        
        
      //  index--
        
      //  return self.viewControllerAtIndex(index)
        
        
        
   // }
    
    
    
   // func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        
        
     //   var vc = viewController as! ContentPageViewController
        
      //  var index = vc.pageIndex as Int
        
        
        
      //  if (index == NSNotFound)
            
       // {
            
         //   return nil
            
      //  }
        
        
        
      //7  index++
        
        
        
       // if (index == self.pageTitles.count)
            
       // {
            
         //   return nil
            
       // }
        
        
        
      //  return self.viewControllerAtIndex(index)
        
        
        
  //  }
    
    
    
 //   func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
        
   // {
        
     //   return self.pageTitles.count
        
  //  }
    
    
  //  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
        
   // {
        
     //   return 0
        
   // }



}
