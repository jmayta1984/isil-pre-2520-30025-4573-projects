//
//  ProductDetail.swift
//  EasyShop
//
//  Created by Alumno on 12/09/25.
//

import SwiftUI

struct ProductDetail: View {
    let product: Product
    
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
                    Image(systemName: "heart")
                        .font(.title2)
                        .padding(8)
                        .background(.background)
                        .clipShape(Circle())
                        .padding(8)

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
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                        .padding(.horizontal)

                    }
                    Spacer()
                    HStack {
                        IconBadge(name: "minus")
                        Text("1")
                        IconBadge(name: "plus")
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
                Button(action: {}) {
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
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                     
                }

            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProductDetail(product: products[0])
}
