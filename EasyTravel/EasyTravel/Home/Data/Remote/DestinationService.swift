//
//  DestinationService.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//

import Foundation

class DestinationService {
    
    static let shared = DestinationService()
    
    private init() {}
    
    func getDestinations(category: String, completion: @escaping([Destination]?, String?) -> Void) {
        let endpoint = "https://travelapi-1071627934947.us-central1.run.app/api/destinations?type=\(category)"
        
        guard let url = URL(string: endpoint) else {
            completion(nil, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                completion(nil, "Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                completion(nil, "Error: no data found")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else     {
                completion(nil, "Error: invalid response from API")
                return
            }
            
            do{
                let wrapperDto = try JSONDecoder().decode(DestinationsWrapperDto.self, from: data)
                
                let destinations = wrapperDto.destinations.map { destinationDto in
                    Destination(
                        id: destinationDto.id,
                        title: destinationDto.title,
                        posterPath: destinationDto.posterPath,
                        overview: destinationDto.overview)
                }
                
                completion(destinations, nil)
                
            } catch let error {
                completion(nil, "Error: \(error.localizedDescription)")
            }

        }
        task.resume()
    }
    
    
}

