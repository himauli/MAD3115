//
//  ContactsCell.swift
//  Day9Collection
//
//  Created by MacStudent on 2018-03-05.
//  Copyright © 2018 Foram. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell {

    
    @IBOutlet weak var contactTitle: UILabel!
    
    @IBOutlet weak var contactSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
