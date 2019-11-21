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
        
        welcome.frame = CGRect(x: 10, y: 10, width: 211, height: 72)
        foodmania.frame = CGRect(x: 20, y: 20, width: 211, height: 72)
       
        UIView.animate(withDuration: 3) {
             self.welcome.frame = CGRect(x: 16, y: 50, width: 211, height: 72)
        }
        UIView.animate(withDuration: 3) {
             self.foodmania.frame = CGRect(x: 103, y: 100, width: 211, height: 72)
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
