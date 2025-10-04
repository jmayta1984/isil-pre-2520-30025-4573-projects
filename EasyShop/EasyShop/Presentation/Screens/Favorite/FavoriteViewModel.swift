//
//  FavoriteViewModel.swift
//  EasyShop
//
//  Created by Alumno on 3/10/25.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published var favoriteProducts:[Product] = []
    
    func toggleFavorite(product: Product) {
        if let index = favoriteProducts.firstIndex(where: { $0.id == product.id  }) {
            favoriteProducts.remove(at: index)
        } else  {
            favoriteProducts.append(product)
        }
    }
    
  
}
