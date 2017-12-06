//
//  FriendsTableViewController.swift
//  ios-itesm-2016a-22-jan-2016
//
//  Created by miguelicious on 1/23/16.
//  Copyright © 2016 miguelicious. All rights reserved.
//

import UIKit

enum FriendsTable {
    case BestFriends, Friends
    
    func toSection() -> Int {
        switch self {
        case .BestFriends:
            return 0
        case .Friends:
            return 1
        }
    }
}

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet var marTableView: UITableView!
    
    let bestFriends: [[String: String]] = [
        ["name": "Hugo", "age": "35 years"],
        ["name": "Paco", "age": "28 years"],
        ["name": "Luis", "age": "45 years"]
    ]
    
    let friends: [[String: String]] = [
        ["name": "José", "age": "23 years"],
        ["name": "Jesús", "age": "24 years"],
        ["name": "Gonzalo", "age": "25 years"],
        ["name": "José", "age": "23 years"],
        ["name": "Jesús", "age": "24 years"],
        ["name": "Gonzalo", "age": "25 years"],
        ["name": "José", "age": "23 years"],
        ["name": "Jesús", "age": "24 years"],
        ["name": "Gonzalo", "age": "25 years"],
        ["name": "José", "age": "23 years"],
        ["name": "Jesús", "age": "24 years"],
        ["name": "Gonzalo", "age": "25 years"]
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName:"CustomCell", bundle: nil)
        marTableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "cell")
    }

    @IBAction func logoutWasPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == FriendsTable.BestFriends.toSection() ? bestFriends.count : friends.count
//        
//        if section == 0 {
//            return bestFriends.count
//        } else {
//            return friends.count
//        }
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath) as! CustomCell
//        cell.textLabel!.text = indexPath.section == FriendsTable.BestFriends.toSection() ? bestFriends[indexPath.row]["name"] : friends[indexPath.row]["name"]
//        cell.detailTextLabel!.text = indexPath.section == FriendsTable.BestFriends.toSection() ? bestFriends[indexPath.row]["age"] : friends[indexPath.row]["age"]
        
        cell.marTitle.text = indexPath.section == FriendsTable.BestFriends.toSection() ? bestFriends[indexPath.row]["name"] : friends[indexPath.row]["name"]
        cell.marSubtitle.text = indexPath.section == FriendsTable.BestFriends.toSection() ? bestFriends[indexPath.row]["age"] : friends[indexPath.row]["age"]
//        cell.marImage.image = UIImage(named: "Profile.png")

        
//        let text: String! = indexPath.section == 0 ? bestFriends[indexPath.row] : friends[indexPath.row]
        
//        if indexPath.section == 0 {
//            text = bestFriends[indexPath.row]
//        } else {
//            text = friends[indexPath.row]
//        }

//        cell.textLabel!.text = text

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == FriendsTable.BestFriends.toSection() ? "Best friends" : "Friends"
//        if section == 0 {
//            return "Best friends"
//        } else {
//            return "Friends"
//        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
