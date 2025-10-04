//
//  ProductListView.swift
//  EasyStore
//
//  Created by Alumno on 3/10/25.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                ProductCard(product: product)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ProductListView()
}


struct ProductCard:View {
    let product: Product
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image.resizable()
                    .frame(width: 92, height: 92)
            } placeholder: {
                ProgressView()
                    .frame(width: 92, height: 92)
            }

            
            VStack (alignment: .leading){
                Text(product.title)
                    .font(.headline)
                Text(product.description).lineLimit(2)
                    .font(.subheadline)
            }
        }
      
        
    }
}
