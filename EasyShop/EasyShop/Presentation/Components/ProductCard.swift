//
//  ProductCard.swift
//  EasyShop
//
//  Created by Alumno on 12/09/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    var body: some View {
        VStack (alignment: .leading){
            
            AsyncImage(url: URL(string: product.image),
                       content: { image in
                image.resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 160)
                
            }) {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .frame(height: 160)
            }
            VStack (alignment: .leading){
                Text(product.name)
                    .lineLimit(1)
                Text("$ \(String(product.price))")
                    .bold()
            }
            .padding()
            
        }
    }
}
