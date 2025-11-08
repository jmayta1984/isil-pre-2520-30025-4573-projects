//
//  HomeViewModel.swift
//  EasyMeal
//
//  Created by Alumno on 7/11/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var query: String = ""
    
    func getAllCategories() {
       categories = CategoryRepository.shared.getAllCategories()
    }
}
