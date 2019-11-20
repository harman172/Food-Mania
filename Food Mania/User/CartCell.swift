//
//  CartCell.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-20.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    func setName(name: String, quantity: Int, price: Double){
        
        lblName.text = name
        lblQuantity.text = "\(quantity)"
        lblPrice.text = "\(price)"
    }
    
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
 */
    
}
