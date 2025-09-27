//
//  ProductDetailView.swift
//  EasyShop
//
//  Created by Alumno on 12/09/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    @StateObject var viewModel = ProductDetailViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    
    @State var isFavorite = false
    @State var selectedSize: String? = nil
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ZStack(alignment: .topTrailing) {
                    AsyncImage(
                        url: URL(string: product.image),
                        content: { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 256)
                            
                            
                        }) {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .frame(height: 256)
                        }
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .font(.title2)
                            .padding(8)
                            .background(.background)
                            .clipShape(Circle())
                            .padding(8)
                    }

                    

                }
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            

                
                HStack {
                    Text(product.name)
                        .font(.headline)
                    Spacer()
                    Text("$ \(String(product.price))")
                        .font(.headline)
                }
                .padding()
                
                HStack {
                    Text("Select size")
                        .font(.subheadline)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(product.sizes, id: \.self) { size in
                                Text(size)
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .background(
                                        size == selectedSize ? .black : .gray.opacity(0.1))
                                    .foregroundStyle(size == selectedSize ? .white : .black)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .onTapGesture {
                                        selectedSize = size
                                    }
                            }
                        }
                        .padding(.horizontal)

                    }
                    Spacer()
                    HStack {
                        RoundedIcon(name: "minus"){
                            viewModel.decreaseQuantity()
                        }
                        
                        Text("\(viewModel.quantity)")
                            .frame(width: 24)
                        
                        RoundedIcon(name: "plus"){
                            viewModel.increaseQuantity()
                        }
                    }
                    .padding(.horizontal)
                }
                
                
                HStack {
                    Text("Description")
                        .font(.headline)
                    Spacer()
                }
                .padding()
            }
            
            
            HStack {
                Button(action: {
                    
                    guard let size = selectedSize else { return }
                    
                    cartViewModel.addCartItem(
                        product: product,
                        size: size,
                        quantity: viewModel.quantity)
                }) {
                    HStack {
                        Image(systemName: "plus.square")
                        Text("Add to cart")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke( .primary, lineWidth: 2)
                    }
                    
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "cart")
                        Text("Buy now")
                           
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                     
                }

            }
            .padding(.horizontal)
        }
        .tint(.primary)
    }
}

#Preview {
    ProductDetailView(product: products[0])
}
