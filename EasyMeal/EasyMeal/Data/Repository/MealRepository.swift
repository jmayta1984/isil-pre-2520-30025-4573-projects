//
//  MealRepository.swift
//  EasyMeal
//
//  Created by Alumno on 14/11/25.
//

class MealRepository {
    
    static let shared = MealRepository()
    private init() {}
    
    private let service = MealService.shared

    func getMealsByCategory(category: String, completion: @escaping (Result<[Meal], ApiError>) -> Void) {
        service.getMealsByCategory(category: category) { result in
            switch result {
                
            case .success(let dtos):
                let meals = dtos.map({$0.toDomain()})
                completion(.success(meals))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
