//
//  OwnerModel.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-18.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import Foundation

struct Restaurant{
    var restName: String
    var restImage: String
    var userName: String
    var password: String
    var address: String
    
    static var restaurants = [Restaurant]()
    
/*
        
        
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
                  return 1
              }
              
              func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                  return pickerViewData.count
              }

              func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                  
                  return pickerViewData[row]
              }
              
              func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                  
                  if loginStackView.isHidden{
                      if row == 0{
                          registerOwnerSV.isHidden = false
                          registerUserSV.isHidden = true
                          isRegOwner = true
                      }else if row == 1{
                          registerOwnerSV.isHidden = true
                          registerUserSV.isHidden = false
                          isRegOwner = false
                      }
                  }
              }
              
              @IBAction func segmentControl(_ sender: UISegmentedControl) {
                  
                  if sender.selectedSegmentIndex == 0{
                      loginStackView.isHidden = false
                      registerOwnerSV.isHidden = true
                      registerUserSV.isHidden = true
                      buttonRegister.isHidden = true
                  }
                  else if sender.selectedSegmentIndex == 1{
                      loginStackView.isHidden = true
                      registerOwnerSV.isHidden = false
                      registerUserSV.isHidden = true
                      buttonRegister.isHidden = false
                  }
                  
              }
              
              @IBAction func btnRegister(_ sender: UIButton) {
                  if isRegOwner{
                      var alreadyExists = false
                      var inputs = [String]()
                      
                      for index in txtOwner.indices{
                          
                          inputs.append(txtOwner[index].text!)
                          
                          if inputs[index].isEmpty {
                              okAlert(title: "Empty Fields", message: "None of the fields can be empty.")
                              return
                          }
                      }
                      
                      
          //            inputs.append()
                      
                      for index in Restaurant.restaurants.indices{
                          if Restaurant.restaurants[index].userName == inputs[1]{
                              alreadyExists = true
                              break
                          }
                      }
                      
                      if !alreadyExists{
                          let res = Restaurant(restName: inputs[0], restImage: inputs[4], userName: inputs[1], password: inputs[2], address: inputs[3])
                          Restaurant.restaurants.append(res)
                          okAlert(title: "Success!!", message: "Restaurant has been registered successfully.")
                          print(Restaurant.restaurants)
                      } else{
                          okAlert(title: "Invalid username", message: "This username is already taken.\n Try another one.")
                      }
                      
                      
                  }
              }
              
              
              
              func okAlert(title: String, message: String){
                  let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                  let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                  
                  alertController.addAction(okAction)
                  self.present(alertController, animated: true, completion: nil)
              }
          }

          extension UIImage {
              func toString() -> String? {
                  let data: Data? = self.pngData()
                  return data?.base64EncodedString(options: .endLineWithLineFeed)
              }
 
 */
}
