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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        self.navigationItem.title =
        
        print("\(resIndex)")
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
                    destItem.itemName = Restaurant.restaurants[resIndex].menu[index.section].item[index.row].itemName
                    destItem.price = Restaurant.restaurants[resIndex].menu[index.section].item[index.row].price
                    destItem.desc = Restaurant.restaurants[resIndex].menu[index.section].item[index.row].description
                }
            }
        }
    }
    

}
