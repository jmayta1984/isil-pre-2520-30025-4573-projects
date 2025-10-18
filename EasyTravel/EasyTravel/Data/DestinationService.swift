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
    
    func getDestinations(completion: @escaping([Destination]?, String?) -> Void) {
        let endpoint = "https://travelapi-1071627934947.us-central1.run.app/api/destinations"
        
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
        }
    }
    
    
}

