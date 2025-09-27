//
//  CartItemCard.swift
//  EasyShop
//
//  Created by Alumno on 19/09/25.
//

import SwiftUI

struct CartItemCard: View {
    let cartItem: CartItem
    var body: some View {
        HStack {
            
            AsyncImage(
                url: URL(string: cartItem.product.image),
                content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 96, height: 96)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                },
                placeholder: {
                    ProgressView()
                        .frame(width: 96, height: 96)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                })
            
            VStack (alignment: .leading){
                Text(cartItem.product.name).font(.headline)
                Text("Size: \(cartItem.size) - Quantity: \(cartItem.quantity)")
                Spacer()
                Text("\(cartItem.product.price, specifier: "%.2f")")
                    .font(.title2)
                    .bold()
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 96)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
    }
}

