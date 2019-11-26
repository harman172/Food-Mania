//
//  UserMainVC.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-19.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class UserMainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Restaurant.restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resCell", for: indexPath) as! RestaurantCell
        cell.resImageView.image = Restaurant.restaurants[indexPath.row].restImage
        cell.resName.text = Restaurant.restaurants[indexPath.row].restName
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "resDetailsSegue", sender: nil)
//    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let destRestDetails = segue.destination as? ResDetailsTVC{
            
            if let cell = sender as? RestaurantCell{
                if let indexPath = collectionView.indexPath(for: cell){
                   
                    destRestDetails.resIndex = indexPath.row
                }
            }
            
        }
    }
    
    
    @IBAction func btnLogout(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Sign Out!", message: "Do you really want to sign out?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            _ = self.navigationController?.popViewController(animated: true)
        }
        yesAction.setValue(UIColor.red, forKey: "titleTextColor")
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        noAction.setValue(UIColor.black, forKey: "titleTextColor")
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    

}
