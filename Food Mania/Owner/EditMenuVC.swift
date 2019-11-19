//
//  EditMenuVC.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-18.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class EditMenuVC: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtDesc: UITextView!
    
    var itemName: String?
    var price: String?
    var desc: String?
    
    var delegateRestDetails: RestaurantDetailsTVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtName.text = itemName!
        txtPrice.text = price!
        txtDesc.text = desc!
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegateRestDetails?.updateItem(name: txtName.text!, price: txtPrice.text!, desc: txtDesc.text!)
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
