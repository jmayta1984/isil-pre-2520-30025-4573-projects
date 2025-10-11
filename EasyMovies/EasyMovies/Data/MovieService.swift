//
//  MovieService.swift
//  EasyMovies
//
//  Created by Alumno on 10/10/25.
//

import Foundation

class MovieService {
    
    static let shared = MovieService()
    
    private init() {}
    
    func searchMovies(query: String) {
        
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=3cae426b920b29ed2fb1c0749f258325&query=\(query)"
        
        guard let url = URL(string: urlString) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else { return }
            
            guard let data = data else { return }
        }
        
    }
    
    
}
