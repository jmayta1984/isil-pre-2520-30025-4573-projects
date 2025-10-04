//
//  CartViewModel.swift
//  EasyShop
//
//  Created by Alumno on 26/09/25.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var cartItems:[CartItem] = []
    
    func addCartItem(product: Product, size: String, quantity: Int){
        if let index = cartItems.firstIndex(where: { ($0.product.id == product.id) && ($0.size == size) }) {
            cartItems[index].quantity += quantity
        } else {
            let cartItem = CartItem(product: product, size: size, quantity: quantity)
            cartItems.append(cartItem)
        }
        
        
    }
    
    func removeCartItem(cartItem: CartItem){
        if let index = cartItems.firstIndex(where: { ($0.product.id == cartItem.product.id) && ($0.size == cartItem.size) }) {
            cartItems.remove(at: index)
        }
    }
}
