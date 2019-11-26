//
//  RestaurantDetailsTVC.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-18.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class RestaurantDetailsTVC: UITableViewController {

    var resUsername: String?
    var resIndex: Int?
    
  
   
    var curSectionIndex = -1
    var curRowIndex = -1
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.hidesBackButton = true
        
        for index in Restaurant.restaurants.indices{
            if Restaurant.restaurants[index].userName == resUsername{
                resIndex = index
                break
            }

        }
        
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Restaurant.restaurants[resIndex!].menu.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Restaurant.restaurants[resIndex!].menu[section].type
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        guard !Restaurant.restaurants[resIndex!].menu.isEmpty else{
            return 0
        }
        
            
            return Restaurant.restaurants[resIndex!].menu[section].item.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell"){
            cell.textLabel?.text = Restaurant.restaurants[resIndex!].menu[indexPath.section].item[indexPath.row].itemName
            cell.detailTextLabel?.text = "$\(Restaurant.restaurants[resIndex!].menu[indexPath.section].item[indexPath.row].price)"
            
            return cell
        }
        return UITableViewCell()
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            Restaurant.restaurants[resIndex!].menu[indexPath.section].item.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
           
        }

    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let itemName = Restaurant.restaurants[resIndex!].menu[fromIndexPath.section].item[fromIndexPath.row].itemName
        let itemPrice = Restaurant.restaurants[resIndex!].menu[fromIndexPath.section].item[fromIndexPath.row].price
        let itemDesc = Restaurant.restaurants[resIndex!].menu[fromIndexPath.section].item[fromIndexPath.row].description
        
        let movedItem = Items(itemName: itemName, price: itemPrice, description: itemDesc)
        Restaurant.restaurants[resIndex!].menu[fromIndexPath.section].item.remove(at: fromIndexPath.row)
        
        Restaurant.restaurants[resIndex!].menu[to.section].item.insert(movedItem, at: to.row)
       
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let destAddMenu = segue.destination as? AddMenuVC{
            
            destAddMenu.resIndex = resIndex!
            
        } else if let destEditMenu = segue.destination as? EditMenuVC{
            
            destEditMenu.delegateRestDetails = self
            
            if let tableCell = sender as? UITableViewCell{
                if let index = tableView.indexPath(for: tableCell){
                    destEditMenu.itemName = Restaurant.restaurants[resIndex!].menu[index.section].item[index.row].itemName
                    destEditMenu.price = "\(Restaurant.restaurants[resIndex!].menu[index.section].item[index.row].price)"
                    destEditMenu.desc = Restaurant.restaurants[resIndex!].menu[index.section].item[index.row].description
                    
                    curSectionIndex = index.section
                    curRowIndex = index.row
                }
            }
        }
        
    }
    
    func updateItem(name: String, price: String, desc: String){
        Restaurant.restaurants[resIndex!].menu[curSectionIndex].item[curRowIndex].itemName = name
        Restaurant.restaurants[resIndex!].menu[curSectionIndex].item[curRowIndex].price = Double(price)!
        Restaurant.restaurants[resIndex!].menu[curSectionIndex].item[curRowIndex].description = desc
        
        let indexPath = IndexPath(row: curRowIndex, section: curSectionIndex)
        tableView.reloadRows(at: [indexPath], with: .none)
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

}
