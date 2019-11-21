//
//  AddMenuVC.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-18.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class AddMenuVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var menuCategories: [String]?
    
    @IBOutlet var textViews: [UITextField]!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var resIndex = -1
    var menuIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapGesture)

        
        menuCategories = ["-------", "Veg", "Non veg", "Hot drinks", "Soft drinks", "Snacks", "Asian Food"]
        if Restaurant.restaurants[resIndex].menu.count == 0{
            for item in menuCategories!{
                let menu = Menu(type: item)
                Restaurant.restaurants[resIndex].menu.append(menu)
            }
        }
        
        pickerView.selectRow(0, inComponent: 0, animated: true)
        
       print("----------- \(Restaurant.restaurants[resIndex].menu)")
    }
    
    @IBAction func itemViewTextEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func priceViewTextEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func desViewTextEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @objc func viewTapped(){
        for index in textViews.indices{
            textViews[index].resignFirstResponder()
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Restaurant.restaurants[resIndex].menu.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Restaurant.restaurants[resIndex].menu[row].type
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("pickerrrrrrr \(row)")
        print("\(Restaurant.restaurants[resIndex].menu[row].type)")
        menuIndex = row
    }

    @IBAction func btnSave(_ sender: UIButton) {
//        var sectionExists = false
        
//        let section = textViews[0].text!
        let name = textViews[0].text!
        let price = Double(textViews[1].text!) ?? 0.0
        let desc = textViews[2].text!
        
//        for index in Restaurant.restaurants[resIndex].menu.indices{
//            if Restaurant.restaurants[resIndex].menu[index].type == section{
//                sectionExists = true
//            }
//        }
//
//        if !sectionExists{
//            let menuSection = Menu(type: section)
//            Restaurant.restaurants[resIndex].menu.append(menuSection)
//        }
        
       
        
        let items = Items(itemName: name, price: price, description: desc)
        
//        print("\(Restaurant.restaurants[resIndex].menu.count)")
//        var index = Restaurant.restaurants[resIndex].menu.count - 1
        
//        var menuIndex = -1
        
//        for index in Restaurant.restaurants[resIndex].menu.indices{
//            if Restaurant.restaurants[resIndex].menu[index].type == section{
//                menuIndex = index
//                break
//            }
//            else{
//                menuIndex = Restaurant.restaurants[resIndex].menu.count - 1
//            }
//        }
        
        print("&&&&& \(menuIndex), \(resIndex)")
        Restaurant.restaurants[resIndex].menu[menuIndex].item.append(items)
        
        print(Restaurant.restaurants[resIndex].menu)
        
        _ = navigationController?.popViewController(animated: true)
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
