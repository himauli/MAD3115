//
//  MenuTVCell.swift
//  CustomTable
//
//  Created by Jigisha Patel on 2018-02-22.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class MenuTVCell: UITableViewCell {

    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblSpecial: UILabel!
    @IBOutlet var lblRegularPrize: UILabel!
    @IBOutlet var lblTitle: UILabel!
    
    func show(isSpecial: Bool, price: Double){
        
        //if item not on speciall offer
        if !isSpecial{
            lblSpecial.text = ""
            lblRegularPrize.text = ""
            lblPrice.text = "$ \(price)"
            contentView.backgroundColor = UIColor.white
        }else{//if item on special offer
            lblSpecial.text = "Special"
            lblSpecial.textColor = UIColor.red
            lblRegularPrize.text = "Regular Price $\(price)"
            lblPrice.text = "$ \(price - 1)"
            contentView.backgroundColor = UIColor.init(red: 0.1, green: 1.0, blue: 0.9, alpha: 0.2)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
