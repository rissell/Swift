//
//  CustomCell.swift
//  ios-itesm-2016a-22-jan-2016
//
//  Created by miguelicious on 1/23/16.
//  Copyright © 2016 miguelicious. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var marImage: UIImageView!
    @IBOutlet weak var marTitle: UILabel!
    @IBOutlet weak var marSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
