//
//  StoreService.swift
//  EasyMaps
//
//  Created by Alumno on 21/11/25.
//


enum ApiError: Error {
    case network
    case decoding
    case invalidUrl
    case invalidResponse
    case serverError
    case noData
}

import Foundation

class StoreService {
    
    static let shared = StoreService()
    
    private init() {}
    
    let endpoint = "https://api.escuelajs.co/api/v1/locations"
    
    func getAllStores(completion: @escaping(Result<[StoreDto], ApiError>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(.serverError))
                return
            }
            
            guard let data = data  else {
                completion(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
               let dtos = try JSONDecoder().decode([StoreDto].self, from: data)
                completion(.success(dtos))
                
            } catch {
                completion(.failure(.decoding))
            }
        }
        
        task.resume()
        
    }
}
