//
//  ProductListViewModel.swift
//  EasyStore
//
//  Created by Alumno on 3/10/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    let service = ProductService.shared
    
    func getAllProducts() {
        
        service.getAllProducts { products, error in
            guard let products = products else { return }
            
            DispatchQueue.main.async {
                self.products = products
            }
            
        }
        
    }
    
    init() {
        getAllProducts()
    }
    
}
