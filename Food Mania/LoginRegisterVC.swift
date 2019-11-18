//
//  ViewController.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-17.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class LoginRegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var ivRestaurant: UIImageView!
    
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var registerOwnerSV: UIStackView!
    @IBOutlet weak var registerUserSV: UIStackView!
    
    @IBOutlet weak var buttonRegister: UIButton!
    
    @IBOutlet var txtLogin: [UITextField]!
    @IBOutlet var txtOwner: [UITextField]!
    @IBOutlet var txtUser: [UITextField]!
    
    let pickerViewData = ["Owner", "Customer"]
    var imagePicker = UIImagePickerController()
    
    var isRegOwner = true
    var isLoginOwner = true
    var image_data: UIImage?
    var Uname: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        pickerView.selectRow(0, inComponent: 0, animated: true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapGesture)

    }
    
    @objc func viewTapped(){
        for index in txtLogin.indices{
            txtLogin[index].resignFirstResponder()
        }
        for index in txtOwner.indices{
            txtOwner[index].resignFirstResponder()
        }
        for index in txtUser.indices{
            txtUser[index].resignFirstResponder()
        }
    }

    @IBAction func btnChooseImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")

            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
//            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        image_data = info[UIImagePickerController.InfoKey.originalImage] as! UIImage

        
        ivRestaurant.image = image_data
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    }
    
    
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
               isLoginOwner = true
           }else if row == 1{
               registerOwnerSV.isHidden = true
               registerUserSV.isHidden = false
               isRegOwner = false
               isLoginOwner = false
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
               
               
//               inputs.append("\(image_data!)")
               
               for index in Restaurant.restaurants.indices{
                   if Restaurant.restaurants[index].userName == inputs[1]{
                       alreadyExists = true
                       break
                   }
               }
               
               if !alreadyExists{
                let res = Restaurant(restName: inputs[0], restImage: image_data!, userName: inputs[1], password: inputs[2], address: inputs[3])
                       Restaurant.restaurants.append(res)
                       okAlert(title: "Success!!", message: "Restaurant has been registered successfully.")
                       print(Restaurant.restaurants)
                
                for index in txtOwner.indices{
                    txtOwner[index].text = ""
                }
                ivRestaurant.image = UIImage(systemName: "person")
//                ivRestaurant.image = UIImage(named: inputs[4])
                
               } else{
                   okAlert(title: "Invalid username", message: "This username is already taken.\n Try another one.")
               }
               
               
           }
       }
       
       
    @IBAction func btnLogIn(_ sender: UIButton) {
        
        if isLoginOwner{
            Uname = txtLogin[0].text!
            let password = txtLogin[1].text!
            var isMatched = true
            
            guard !Uname!.isEmpty else {
                okAlert(title: "Empty Fields", message: "None of the fields can be empty.")
                return
            }
            
            for index in Restaurant.restaurants.indices{
            
                if Restaurant.restaurants[index].userName == Uname{
                    
                    if Restaurant.restaurants[index].password == password{
                        isMatched = true
                        break
                    }
                    else{
                        isMatched = false
                    }
                }
                else{
                    isMatched = false
                    
                }
            }
            
            if !isMatched{
                okAlert(title: "Error", message: "Incorrect username/password")
            }
            else{
                print("Go in")
            }
        }
    }
    

    
   func okAlert(title: String, message: String){
       let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
       let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
       
       alertController.addAction(okAction)
       self.present(alertController, animated: true, completion: nil)
   }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destRestDetails = segue.destination as? RestaurantDetailsTVC{
            
            destRestDetails.resUsername = Uname!
            
        }
    }
    
    
   }

   extension UIImage {
       func toString() -> String? {
           let data: Data? = self.pngData()
           return data?.base64EncodedString(options: .endLineWithLineFeed)
       }
}

struct Restaurant{
    var restName: String
    var restImage: UIImage
    var userName: String
    var password: String
    var address: String
    var menu = [Menu]()
    
    static var restaurants = [Restaurant]()
    
}
