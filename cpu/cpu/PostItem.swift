//
//  PostItem.swift
//  cpu
//
//  Created by Daniel Risso Elliot on 23/04/16.
//  Copyright © 2016 rissell. All rights reserved.
//

import Foundation
import Firebase

struct PostItem {
    
    let key: String!
    let content: String!
    let header: String!
    let ref: Firebase?
    var important: Bool!
    var privacy: Bool!
    
    // Initialize from arbitrary data
    init(content: String, header: String, important: Bool, privacy: Bool,key: String = "") {
        self.key = key
        self.content = content
        self.header = header
        self.important = important
        self.privacy = privacy
        self.ref = nil
    }
    
    init(snapshot: FDataSnapshot) {
        key = snapshot.key
        content = snapshot.value["content"] as! String
        header = snapshot.value["header"] as! String
        important = snapshot.value["important"] as! Bool
        privacy = snapshot.value["privacy"] as! Bool
        ref = snapshot.ref
    }
    
    func toAnyObject() -> AnyObject {
        return [
            "content": content,
            "header": header,
            "privacy": privacy,
            "important": important
        ]
    }
}
  