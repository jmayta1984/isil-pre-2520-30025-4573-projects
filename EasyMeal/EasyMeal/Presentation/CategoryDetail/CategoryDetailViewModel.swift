//
//  CategoryDetailViewModel.swift
//  EasyMeal
//
//  Created by Alumno on 14/11/25.
//

import Foundation

class CategoryDetailViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    @Published var message: String?

    let repository = MealRepository.shared
    
    func getMealsByCategory(category: String) {
        repository.getMealsByCategory(category: category) { result in
            switch result {
                
            case .success(let meals):
                self.meals = meals
            case .failure(let error): break
                self.message = error.rawValue
            }
        }
    }
}
