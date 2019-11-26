//
//  ResDetailsTVC.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-19.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class ResDetailsTVC: UITableViewController {

    
    var resIndex = -1
    var selectedIndex = [CartItems]()
    var cartArray = [CartItems]()
    var quantity = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        self.navigationItem.title =
        
        self.tableView.allowsMultipleSelection = true
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Restaurant.restaurants[resIndex].menu.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Restaurant.restaurants[resIndex].menu[section].item.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Restaurant.restaurants[resIndex].menu[section].type
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell"){
            cell.textLabel?.text = Restaurant.restaurants[resIndex].menu[indexPath.section].item[indexPath.row].itemName
            cell.detailTextLabel?.text = "$\(Restaurant.restaurants[resIndex].menu[indexPath.section].item[indexPath.row].price)"
            return cell
            
        }

        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//         selectedIndex.append(indexPath.row)
        let resName = Restaurant.restaurants[resIndex].restName
        let name = Restaurant.restaurants[resIndex].menu[indexPath.section].item[indexPath.row].itemName
        let price = Restaurant.restaurants[resIndex].menu[indexPath.section].item[indexPath.row].price
//        let desc = Restaurant.restaurants[resIndex].menu[indexPath.section].item[indexPath.row].description
        let qty = Restaurant.restaurants[resIndex].menu[indexPath.section].item[indexPath.row].quantity
        
//        let item = Items(itemName: name, price: price, description: desc, quantity: qty)
        let item = CartItems(resName: resName, itemName: name, price: price, quantity: qty)
        selectedIndex.append(item)
        
        Restaurant.restaurants[resIndex].menu[indexPath.section].item[indexPath.row].quantity = 1
        
         
     }
     
     override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         tableView.cellForRow(at: indexPath)?.accessoryType = .detailButton
         
         for index in selectedIndex.indices{
            if selectedIndex[index].itemName == Restaurant.restaurants[resIndex].menu[indexPath.section].item[indexPath.row].itemName{
                 selectedIndex.remove(at: index)
                 break
             }
         }
    
        
     }

    
    @IBAction func btnAddCart(_ sender: UIBarButtonItem) {

        
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
             for indexPath in selectedIndexPaths {
              
                tableView.deselectRow(at: indexPath, animated: true)
                 tableView.cellForRow(at: indexPath)?.accessoryType = .detailButton
             }
        }
        
         

        
        var alreadyExists = false
        
        for index in selectedIndex.indices{
            
            if !cartArray.isEmpty{
                for cIndex in cartArray.indices{
                    if cartArray[cIndex].itemName == selectedIndex[index].itemName{
                        okAlert(title: "Already in cart", message: "The item you have selected is already in cart.")
                        alreadyExists = true
                        break
                    }
                }
            }
        }
        
        if !alreadyExists{
            for index in selectedIndex.indices{
                cartArray.append(selectedIndex[index])
            }
            okAlert(title: "Success!", message: "Items added to cart successfully.")
        }
        
//        for index in selectedIndex.indices{
//
//            if !Customer.customers.isEmpty{
//                for cIndex in Customer.customers[Customer.curCustomerIndex].cartItems.indices{
//                    if Customer.customers[Customer.curCustomerIndex].cartItems[cIndex].itemName == selectedIndex[index].itemName{
//                        okAlert(title: "Already in cart", message: "The item you have selected is already in cart.")
//                        alreadyExists = true
//                        break
//                    }
//
//                }
//            }
//        }
//
//        if !alreadyExists{
//            for index in selectedIndex.indices{
//            Customer.customers[Customer.curCustomerIndex].cartItems.append(selectedIndex[index])
//            }
//        }

        selectedIndex = []
        
        tableView.reloadData()
    
    }
    
    func okAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        okAction.setValue(UIColor.brown, forKey: "titleTextColor")
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let destItem = segue.destination as? ItemDetailsVC{
            if let tableCell = sender as? UITableViewCell{
                if let index = tableView.indexPath(for: tableCell){
//                    destItem.itemName = Restaurant.restaurants[resIndex].menu[index.section].item[index.row].itemName
//                    destItem.price = Restaurant.restaurants[resIndex].menu[index.section].item[index.row].price
//                    destItem.desc = Restaurant.restaurants[resIndex].menu[index.section].item[index.row].description
                    destItem.section = index.section
                    destItem.row = index.row
                    destItem.resIndex = resIndex
                }
            }
        } else if let destOrders = segue.destination as? ViewOrderTVC{
            destOrders.delegateResDetails = self
            for index in cartArray.indices{
                destOrders.cart.append(cartArray[index])
            }
            
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
           for indexPath in selectedIndexPaths {
             
              tableView.deselectRow(at: indexPath, animated: true)
           }
       }
    }
    

}
