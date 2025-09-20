//
//  CartItem.swift
//  EasyShop
//
//  Created by Alumno on 19/09/25.
//

struct CartItem {
    let product: Product
    let size: String
    let quantity: Int
}

let cartItems = [
    CartItem(product: products[0], size: "7.0", quantity: 5),
    CartItem(product: products[1], size: "7.5", quantity: 3),
    CartItem(product: products[2], size: "8.5", quantity: 2)
]
