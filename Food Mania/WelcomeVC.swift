//
//  WelcomeVC.swift
//  Food Mania
//
//  Created by MacStudent on 2019-11-20.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet var welcome: UILabel!
    @IBOutlet var foodmania: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        //navigationController?.hidesBarsOnTap = true
        self.navigationController?.setToolbarHidden(true, animated: false)
        
       
        
    
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
