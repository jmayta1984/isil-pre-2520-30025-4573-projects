//
//  AuthService.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

import Foundation

class AuthService {
    
    static let shared = AuthService()
    
    private init() {}
    
    func register(requestDto: RegisterRequestDto) {
        let endpoint = "https://travelapi-1071627934947.us-central1.run.app/api/users/register"
        
        guard let url = URL(string: endpoint) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let body = try JSONEncoder().encode(requestDto)
            urlRequest.httpBody = body
        } catch let jsonError {
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                return
            }
            
            guard let data = data else { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 201 else { return }
            
        }

    }
    
}
