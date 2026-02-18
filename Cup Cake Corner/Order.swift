//
//  order.swift
//  Cup Cake Corner
//
//  Created by kalyan on 2/16/26.
//

import Foundation


@Observable

class Order : Codable{
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _street = "street"
        case _city = "city"
        case _zip = "zip"
    }
     static let types = ["Vanilla","strawberry","chocolate","rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false{
        didSet{
            extraFrosting = false
            addSprinkles = false
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    
     var street = ""
     var city = ""
     var Country = ""
    var zip = ""
    
    var hasValidAdress: Bool{
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || street.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            return false
        }
        return true
    }
    
    var cost: Decimal{
        var cost = Decimal(quantity) * 2
        
        cost += Decimal(type)/2
        
        if extraFrosting{
            cost += Decimal(quantity)
        }
        
        if addSprinkles{
            cost += Decimal(quantity)/2
        }
        
        return cost
    }
}
