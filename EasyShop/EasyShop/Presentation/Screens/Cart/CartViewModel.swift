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
        let cartItem = CartItem(product: product, size: size, quantity: quantity)
        cartItems.append(cartItem)
    }
    
    func removeCartItem(indexSet: IndexSet){
        cartItems.remove(atOffsets: indexSet)
    }
}
