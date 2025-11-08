//
//  CategoryRepository.swift
//  EasyMeal
//
//  Created by Alumno on 7/11/25.
//

class CategoryRepository {
    
    static let shared = CategoryRepository()
    private init() {}
    
    func getAllCategories() -> [Category] {
        return []
    }
}
