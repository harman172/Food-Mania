//
//  ItemDetailsVC.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-20.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {

    var itemName: String?
    var price: Double?
    var desc: String?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblName.text = itemName
        lblPrice.text = "\(price ?? 0.0)"
        lblDesc.text = desc
    }
    
    @IBAction func btnIncrement(_ sender: UIButton) {
        var value = Int(lblQuantity.text!)
        value! += 1
        
//        if value! < 0{
//            lblQuantity.text = "0"
//        } else{
            lblQuantity.text = "\(value!)"
//        }
    }
    
    @IBAction func btnDecrement(_ sender: UIButton) {
        
        var value = Int(lblQuantity.text!)
        if value == 0{
            lblQuantity.text = "0"
            
        }
        else{
            value! -= 1
            lblQuantity.text = "\(value!)"
        }
    }
    
    /*
    @IBAction func btnAddCart(_ sender: UIBarButtonItem) {
        let item = CartItems(itemName: itemName!, price: price!, quantity: Int(lblQuantity.text!)!)
        
        Customer.customers[Customer.curCustomerIndex].cartItems.append(item)
        
        print(Customer.customers[Customer.curCustomerIndex].cartItems)
        
    }
 */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
