//
//  FavoriteView.swift
//  EasyShop
//
//  Created by Alumno on 26/09/25.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var viewModel: FavoriteViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.favoriteProducts) { product in
                ProductCard(product: product)
            }
            .onDelete { indexSet in
                viewModel.removeFavoriteProduct(indexSet: indexSet)
            }
        }.listStyle(.plain)
    }
}
