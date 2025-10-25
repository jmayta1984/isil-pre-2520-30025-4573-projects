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
    
    func register(requestDto: RegisterRequestDto, completion: @escaping(Bool, String) -> Void ) {
        let endpoint = "https://travelapi-1071627934947.us-central1.run.app/api/users/register"
        
        guard let url = URL(string: endpoint) else {
            completion(false, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let body = try JSONEncoder().encode(requestDto)
            urlRequest.httpBody = body
        } catch let jsonError {
            completion(false, "Error: \(jsonError.localizedDescription)")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(false, "Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                completion(false, "Error: no data found")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
                completion(false, "Error: invalid response")
                return
            }
            
            
            do {
                let responseDto = try JSONDecoder().decode(RegisterResponseDto.self, from: data)
                completion(true, responseDto.message)
            } catch let jsonError {
                completion(false, "Error: \(jsonError.localizedDescription)")
                return
            }
            
        }
        task.resume()

    }
    
}
