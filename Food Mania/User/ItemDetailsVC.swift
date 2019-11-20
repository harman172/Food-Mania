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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblName.text = itemName
        lblPrice.text = "\(price ?? 0.0)"
        lblDesc.text = desc
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
