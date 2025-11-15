//
//  CategoryRepository.swift
//  EasyMeal
//
//  Created by Alumno on 7/11/25.
//

class CategoryRepository {
    
    static let shared = CategoryRepository()
    private init() {}
    
    private let service = CategoryService.shared

    func getAllCategories(completion: @escaping (Result<[Category], ApiError>) -> Void) {
        service.getAllCategories { result in
            switch result {
                
            case .success(let dtos):
                let categories = dtos.map({$0.toDomain()})
                completion(.success(categories))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
