//
//  ViewOrderTVC.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-20.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class ViewOrderTVC: UITableViewController {

    
    @IBOutlet weak var lblTotal: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let nib = UINib(nibName: "CartCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "order cell")
        
        var total = 0.0
        for index in Customer.customers[Customer.curCustomerIndex].cartItems.indices{
            
            let price = Customer.customers[Customer.curCustomerIndex].cartItems[index].price * Double(Customer.customers[Customer.curCustomerIndex].cartItems[index].quantity)
            
            total += price
        }
        
        lblTotal.title = "Total: $\(total)"

    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Customer.customers[Customer.curCustomerIndex].cartItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard !Customer.customers[Customer.curCustomerIndex].cartItems.isEmpty else {
            return UITableViewCell()
        }
        
        let name = Customer.customers[Customer.curCustomerIndex].cartItems[indexPath.row].itemName
        let quantity = Customer.customers[Customer.curCustomerIndex].cartItems[indexPath.row].quantity
        let price = Customer.customers[Customer.curCustomerIndex].cartItems[indexPath.row].price
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "order cell") as! CartCell
        cell.setName(name: name, quantity: quantity, price: price)
        return cell

        // Configure the cell...

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
            Customer.customers[Customer.curCustomerIndex].cartItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
