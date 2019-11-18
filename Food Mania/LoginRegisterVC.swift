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
    
    
    let pickerViewData = ["Owner", "Customer"]
    var imagePicker = UIImagePickerController()
    
    
    
    @IBOutlet var txtLogin: [UITextField]!
    @IBOutlet var txtOwner: [UITextField]!
    @IBOutlet var txtUser: [UITextField]!
    
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
            imagePicker.sourceType = .savedPhotosAlbum
//            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        
        let image_data = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
//        print("\(image_data)")
        ivRestaurant.image = image_data
//        print("*******")
//        let imageData:Data = image_data.pngData()!
//        let imageStr = imageData.base64EncodedString()
//        print("**** \(imageStr)")
        imagePicker.dismiss(animated: true) {
            
        }
        
        
        
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
        
        if loginStackView.isHidden{            if row == 0{
                registerOwnerSV.isHidden = false
                registerUserSV.isHidden = true
            }else if row == 1{
                registerOwnerSV.isHidden = true
                registerUserSV.isHidden = false
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
}

