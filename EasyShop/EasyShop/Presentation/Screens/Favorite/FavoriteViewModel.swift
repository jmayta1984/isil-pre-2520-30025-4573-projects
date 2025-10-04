//
//  FavoriteViewModel.swift
//  EasyShop
//
//  Created by Alumno on 3/10/25.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published var favoriteProducts:[Product] = []
    
    func addFavoriteProduct(product: Product) {
        favoriteProducts.append(product)
    }
    
    func removeFavoriteProduct(indexSet: IndexSet) {
        favoriteProducts.remove(atOffsets: indexSet)
        
    }
}
