//
//  CustomerModel.swift
//  Food Mania
//
//  Created by Harmanpreet Kaur on 2019-11-18.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import Foundation

struct Customer{
    var name: String
    var emailID: String
    var username: String
    var password: String
    
    var cartItems = [CartItems]()
    
    static var customers = [Customer]()
    static var curCustomerIndex = -1
}
