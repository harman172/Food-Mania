//
//  ItemDetailsVC.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-20.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {


    var section: Int?
    var row: Int?
    var resIndex: Int?
    
    
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        lblPrice.text = "\(Restaurant.restaurants[resIndex!].menu[section!].item[row!].price)"
        lblDesc.text = Restaurant.restaurants[resIndex!].menu[section!].item[row!].description
        
        self.navigationItem.title = Restaurant.restaurants[resIndex!].menu[section!].item[row!].itemName
    }
    
    @IBAction func btnIncrement(_ sender: UIButton) {
        var value = Int(lblQuantity.text!)
        value! += 1
        

            lblQuantity.text = "\(value!)"

        Restaurant.restaurants[resIndex!].menu[section!].item[row!].quantity = value!
    }
    
    @IBAction func btnDecrement(_ sender: UIButton) {
        
        var value = Int(lblQuantity.text!)
        if value == 0{
            lblQuantity.text = "0"
            
        }
        else{
            value! -= 1
            lblQuantity.text = "\(value!)"
            Restaurant.restaurants[resIndex!].menu[section!].item[row!].quantity = value!
        }
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
