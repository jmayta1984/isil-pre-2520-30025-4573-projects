//
//  CategoryService.swift
//  EasyMeal
//
//  Created by Alumno on 7/11/25.
//

import Foundation

enum ApiError: String, Error {
    case url = "URL error"
    case data = "Data error"
    case networking = "Network error"
    case request = "Request error"
    case decoding = "Decoding error"
    case response = "Response error"
}


class CategoryService {
    
    func getAllCategories(completion: @escaping (Result<[CategoryDto], ApiError >) -> Void ) {
        guard let url = URL(string: ApiConstants.baseUrl) else {
            completion(.failure(.url))
            return
        }
        
        let categoriesUrl = url.appending(path: ApiConstants.categoriesEndpoint)
        
        var request = URLRequest(url: categoriesUrl)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error {
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
                let wrapperDto = try JSONDecoder().decode(CategoriesWrapperDto.self, from: data)
                completion(.success(wrapperDto.categories))
            } catch {
                completion(.failure(.decoding))
            }
            
        }
        
        task.resume()
    }
}
