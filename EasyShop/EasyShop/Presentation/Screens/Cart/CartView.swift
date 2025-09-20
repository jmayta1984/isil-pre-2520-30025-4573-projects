//
//  CartView.swift
//  EasyShop
//
//  Created by Alumno on 19/09/25.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        ZStack (alignment: .bottom){
            VStack {
                
                List{
                    ForEach(cartItems, id: \.self.product.id) { cartItem in
                        CartItemCard(cartItem: cartItem)
                            
                            
                    }
                    .onDelete { indexSet in
                        
                    }
                    .listRowSeparator(.hidden)
                    
                }
                .listStyle(.plain)
        
            }
            
            Button(action: {
            }) {
                Text("Checkout")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 8)
                
            }

        }
        .background(.gray.opacity(0.1))
    }
}

#Preview {
    CartView()
}
