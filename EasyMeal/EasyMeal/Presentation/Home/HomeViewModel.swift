//
//  HomeViewModel.swift
//  EasyMeal
//
//  Created by Alumno on 7/11/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var message: String?
    @Published var query: String = ""
    
    let repository = CategoryRepository.shared
    
    func getAllCategories() {
        repository.getAllCategories { result in
            switch result {
                
            case .success(let categories):
                self.categories = categories
            case .failure(let error):
                self.message = error.rawValue
            }
        }
    }
}
