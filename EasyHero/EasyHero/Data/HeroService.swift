//
//  HeroService.swift
//  EasyHero
//
//  Created by Alumno on 28/11/25.
//

import Foundation

class HeroService {
    
    static let shared = HeroService()
    private init () {}
    
    func searchHeroes(by query: String, completion: @escaping(Result<[Hero], ApiError>) -> Void ) {
        
        guard let url = URL(string: "\(ApiConstants.baseUrl)/\(ApiConstants.token)/\(ApiConstants.searchHeroesEndpoint)/\(query)") else {
            completion(.failure(.invalidUrl))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.custom(message: error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.serverError))
                return
            }
            
            do {
                let wrapperDto = try JSONDecoder().decode(HeroesWrapperDto.self, from: data)
                let dtos = wrapperDto.heroes
                let heroes = dtos.map { heroDto in
                    heroDto.toDomain()
                }
                completion(.success(heroes))
                
            } catch (let error) {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
