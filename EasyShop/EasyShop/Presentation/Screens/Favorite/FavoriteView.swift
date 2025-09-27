//
//  FavoriteView.swift
//  EasyShop
//
//  Created by Alumno on 26/09/25.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        List {
            ForEach(homeViewModel.favoriteProducts) { product in
                ProductCard(product: product)
            }
            .onDelete { indexSet in
                homeViewModel.removeFavoriteProduct(indexSet: indexSet)
            }
        }.listStyle(.plain)
    }
}
