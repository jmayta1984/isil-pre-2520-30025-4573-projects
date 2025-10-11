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

