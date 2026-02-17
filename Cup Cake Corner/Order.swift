//
//  order.swift
//  Cup Cake Corner
//
//  Created by kalyan on 2/16/26.
//

import Foundation


@Observable

class Order{
     static let types = ["Vanilla","strawberry","chocolate","rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false
    var extraFrosting = false
    var addSprinkles = false
}
