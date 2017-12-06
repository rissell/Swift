//
//  PostsListTableViewController.swift
//  cpu
//
//  Created by Daniel Risso Elliot on 23/04/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import UIKit
import Firebase

class PostsListTableViewController: UITableViewController {
    
    var items = [PostItem]()
    let ref = Firebase(url: "https://cpu.firebaseio.com")
    var importantList = false
    var publicList = false
    var privateList = false
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if(self.title == "Post List Public"){
            print("Post List Public")
            importantList = false
            publicList = true
            privateList = false
        } else {
            if(self.title == "Post List Private"){
                print("Post List Private")
                importantList = false
                publicList = false
                privateList = true
            } else {
                print("Post List Important")
                importantList = true
                publicList = false
                privateList = false

            }
        }
        if(importantList){
            ref.queryOrderedByChild("important").queryEqualToValue(true).observeEventType(.Value, withBlock: { snapshot in
                var newItems = [PostItem]()
                for item in snapshot.children {
                    let postItem = PostItem(snapshot: item as! FDataSnapshot)
                    newItems.append(postItem)
                }
                self.items = newItems
                self.tableView.reloadData()
            })
        } else {
        
            if(publicList){
                ref.queryOrderedByChild("privacy").queryEqualToValue(false).observeEventType(.Value, withBlock: {   snapshot in
                    var newItems = [PostItem]()
                    for item in snapshot.children {
                        let postItem = PostItem(snapshot: item as! FDataSnapshot)
                        newItems.append(postItem)
                    }
                    self.items = newItems
                    self.tableView.reloadData()
                })
            } else {
                if(privateList){
                    ref.queryOrderedByChild("privacy").queryEqualToValue(true).observeEventType(.Value, withBlock: {    snapshot in
                        var newItems = [PostItem]()
                        for item in snapshot.children {
                            let postItem = PostItem(snapshot: item as! FDataSnapshot)
                            newItems.append(postItem)
                        }
                        self.items = newItems
                        self.tableView.reloadData()
                    })
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell") as! UITableViewCell?
        let postItem = items[indexPath.row]
        
        cell!.textLabel?.text = postItem.header
        cell!.detailTextLabel?.text = postItem.content
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if editingStyle == .Delete {
                let postItem = items[indexPath.row]
                postItem.ref?.removeValue()
            }
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .Normal, title: "More") { action, index in
            print("more button tapped")
        }
        more.backgroundColor = UIColor.lightGrayColor()
        
        let delete = UITableViewRowAction(style: .Default, title: "Delete") { action, index in
            let postItem = self.items[indexPath.row]
            postItem.ref?.removeValue()
            tableView.reloadData()
        }
        delete.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.9)
        
        let share = UITableViewRowAction(style: .Normal, title: "Share") { action, index in
            let textToShare = self.items[indexPath.row].header + " " + self.items[indexPath.row].content
            if let myWebsite = NSURL(string: "http://www.cpu.firebaseapp.com/") {
                let objectsToShare = [textToShare, myWebsite]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                self.presentViewController(activityVC, animated: true, completion: nil)
            }
        }
        share.backgroundColor = UIColor(red: 0, green: 0.36, blue: 1, alpha: 1.0)
        return [delete, share]
    }
    
    
    @IBAction func AddButton(sender: AnyObject) {
        self.presentController("NewPost")
        
    }
    
    @IBAction func logOut(sender: AnyObject) {
        self.presentController("HomeView")
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }

}
