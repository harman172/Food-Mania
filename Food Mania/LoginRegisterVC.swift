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
    
    @IBOutlet weak var loginOwner: UIButton!
    @IBOutlet weak var loginUser: UIButton!
    
    let pickerViewData = ["Owner", "Customer"]
    var imagePicker = UIImagePickerController()
    
    var isRegOwner = true
//    var isLoginOwner = true
    var image_data: UIImage?
    var Uname: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginRegisterVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
               
               NotificationCenter.default.addObserver(self, selector: #selector(LoginRegisterVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
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
//            print("Button capture")

            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
//            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }
    

    @IBAction func userNameTextdidEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func PasswordTextDidEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func restaurantTextDidEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func regUserNameTextDidEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func regPaswordTextDidEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func addressTextDidEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
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
            
            loginUser.isEnabled = true
            loginUser.isHidden = false
           if row == 0{
               registerOwnerSV.isHidden = false
               registerUserSV.isHidden = true
               isRegOwner = true
//               isLoginOwner = true
           }else if row == 1{
               registerOwnerSV.isHidden = true
               registerUserSV.isHidden = false
               isRegOwner = false
//               isLoginOwner = false
           }
        } else{
            loginUser.isHidden = false
            loginUser.isEnabled = true
            if row == 0{
                print("owner")
                loginOwner.isEnabled = true
                loginUser.isEnabled = false
                
                loginOwner.isHidden = false
                loginUser.isHidden = true
                
                
            } else if row == 1{
                print("customer")
                loginOwner.isEnabled = false
                loginUser.isEnabled = true
                
                loginUser.isHidden = false
                loginOwner.isHidden = true
                
                
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
        
        if loginUser.isHidden{
            return
        }
        
        print("------Register-------")
        print("\(Restaurant.restaurants)")
        print("\(Customer.customers)")
        
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
        else{
            
            var inputs = [String]()
            var alreadyExists = false
            
            for index in txtUser.indices{
                inputs.append(txtUser[index].text!)
                
                if inputs[index].isEmpty {
                    okAlert(title: "Empty Fields", message: "None of the fields can be empty.")
                    return
                }
            }
            
            for index in Customer.customers.indices{
                if Customer.customers[index].username == inputs[2]{
                    alreadyExists = true
                    break
                }
            }
            
            if !alreadyExists{
                let customer = Customer(name: inputs[0], emailID: inputs[1], username: inputs[2], password: inputs[3])
                Customer.customers.append(customer)
                okAlert(title: "Success", message: "\(inputs[0]) is a new customer.")
                  
                print(Customer.customers)
                
                for index in txtUser.indices{
                    txtUser[index].text = ""
                }
                    
           } else{
               okAlert(title: "Invalid username", message: "This username is already taken.\n Try another one.")
           }
            
        }
   }
       
       
    @IBAction func btnLogIn(_ sender: UIButton) {
        
        
        if loginOwner.isHidden{
            return
        }
        
        print("------Log in-------")
        print("\(Restaurant.restaurants)")
        print("\(Customer.customers)")
        
//        if isLoginOwner{
            Uname = txtLogin[0].text!
        print(Uname)
        let password = txtLogin[1].text!
        var isMatched = true
        
        guard !Uname!.isEmpty && !password.isEmpty else {
            okAlert(title: "Empty Fields", message: "None of the fields can be empty.")
            return
        }
        
        guard !Restaurant.restaurants.isEmpty else {
            print("---- incorrect owner-----")
            okAlert(title: "Error", message: "Incorrect username/password")
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
                print("---alert not matched owner-----")
                okAlert(title: "Error", message: "Incorrect username/password")
            }
            
//        }
//        else{
           
//        }
    }
    
    
    @IBAction func btnLoginUser(_ sender: UIButton) {
        Uname = txtLogin[0].text!
        let password = txtLogin[1].text!
        var isMatched = true
        
        print("----User login -----")
        
        print("login user ",Uname, password)
        print("\(Customer.customers)")
        
        guard !Uname!.isEmpty && !password.isEmpty else {
            okAlert(title: "Empty Fields", message: "None of the fields can be empty.")
            return
        }
        
        guard !Customer.customers.isEmpty else {
            print("...empty array....")
            okAlert(title: "Error", message: "Incorrect username/password")
            return
        }
        
//        for index in Customer.customers.indices{
//            if Customer.customers[index].username ==
//        }
//
        for index in Customer.customers.indices{
        
            if Customer.customers[index].username == Uname!{
                
                if Customer.customers[index].password == password{
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
            print("---not matched----")
            okAlert(title: "Error", message: "Incorrect username/password")
        } else{
            print("jaaaaaa oyeeee pagalllll")
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
            print(Uname!)
            destRestDetails.resUsername = Uname!
            
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y -= (keyboardFrame.height - 100)
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
        
    }
    
    
   }

//   extension UIImage {
//       func toString() -> String? {
//           let data: Data? = self.pngData()
//           return data?.base64EncodedString(options: .endLineWithLineFeed)
//       }
//}

struct Restaurant{
    var restName: String
    var restImage: UIImage
    var userName: String
    var password: String
    var address: String
    var menu = [Menu]()
    
    static var restaurants = [Restaurant]()
    
}
