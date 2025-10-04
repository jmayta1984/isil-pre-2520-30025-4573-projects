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
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @EnvironmentObject var mainViewModel: MainViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State var isFavorite = false
    @State var selectedSize: String? = nil
    @State var showMessage = false
    
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
                        favoriteViewModel.addFavoriteProduct(product: product)
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
                    Spacer()
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
                    showMessage.toggle()
                    
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
        .sheet(isPresented: $showMessage){
            VStack {
                Text("ADDED TO CART").font(.title2).bold()
                
                HStack {
                    AsyncImage(
                        url: URL(string: product.image),
                        content: { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 96)
                                .frame(height: 96)
                            
                            
                        }) {
                            ProgressView()
                                .frame(width: 96)
                                .frame(height: 96)
                        }
                    VStack (alignment: .leading){
                        Text("\(product.price, specifier: "%.2f")")
                            .padding(.horizontal, 8)
                            .background(.black)
                            .foregroundStyle(.white)
                        Text(product.name).font(.subheadline)
                    }
                    Spacer()
                    
                    
                }
                
                
                Button(action: {
                    showMessage.toggle()
                    dismiss()
                    mainViewModel.selectedTab = 2
                }) {
                    
                    Text("View cart")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, 8)
                    

                }
                
            }
            .presentationDetents([.fraction(0.30)])
        }
        .tint(.primary)
    }
}

