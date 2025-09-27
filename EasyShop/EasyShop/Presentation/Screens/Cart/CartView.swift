//
//  CartView.swift
//  EasyShop
//
//  Created by Alumno on 19/09/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var viewModel: CartViewModel

    var body: some View {
    
        ZStack (alignment: .bottom){
            VStack {
                
                List{
                    ForEach(viewModel.cartItems, id: \.self.product.id) { cartItem in
                        CartItemCard(cartItem: cartItem)
                            
                            
                    }
                    .onDelete { indexSet in
                        viewModel.removeCartItem(indexSet: indexSet)
                    }
                    .listRowSeparator(.hidden)
                    
                }
                .listStyle(.plain)
        
            }
            
            VStack {
                HStack {
                    Text("Total").font(.headline)
                    Spacer()
                    Text("\(viewModel.cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity))}, specifier: "%.2f" )")

                }.padding(.horizontal, 8)
                
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
            

        }
        .background(.gray.opacity(0.1))
    }
}
