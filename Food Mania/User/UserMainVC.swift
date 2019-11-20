//
//  UserMainVC.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-19.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class UserMainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
