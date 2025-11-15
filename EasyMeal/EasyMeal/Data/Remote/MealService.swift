//
//  MealService.swift
//  EasyMeal
//
//  Created by Alumno on 14/11/25.
//

import Foundation

class MealService {
    
    static let shared = MealService()
    private init() {}
    
    func getMealsByCategory(category: String, completion:
                            @escaping (Result<[MealDto], ApiError>) -> Void
    ) {
        guard let url = URL(string: ApiConstants.baseUrl) else {
            completion(.failure(.url))
            return
        }
        let mealsUrl = url
            .appending(path: ApiConstants.mealsEndpoint)
            .appending(queryItems: [URLQueryItem(name: "c", value: category)])
        
        var request = URLRequest(url: mealsUrl)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(.request))
                return
            }
            
            guard let data = data else {
                completion(.failure(.data))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else  {
                completion(.failure(.response))
                return
            }
            
            do {
                let wrapperDto = try JSONDecoder().decode(MealsWrapperDto.self, from: data)
                completion(.success(wrapperDto.meals))
            } catch {
                completion(.failure(.decoding))
            }
            
        }
        
        task.resume()
    }
}
