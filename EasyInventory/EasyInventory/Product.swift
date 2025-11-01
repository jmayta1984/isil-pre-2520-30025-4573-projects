//
//  Product.swift
//  EasyInventory
//
//  Created by Alumno on 31/10/25.
//

import SwiftData

@Model
final class Product {
    var name: String
    var quantity: Int
    
    init(name: String, quantity: Int = 0) {
        self.name = name
        self.quantity = quantity
    }
}
