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
    
    func searchMovies(query: String, completion: @escaping ([Movie]?, String?) -> Void) {
        
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=3cae426b920b29ed2fb1c0749f258325&query=\(query)"
        
        guard let url = URL(string: urlString) else {
            completion(nil, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(nil, "Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            guard let data = data else {
                completion(nil, "Error: no data found")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Error: invalid response from API")
                return
            }
            do {
                let wrapperDto = try JSONDecoder().decode(MoviesWrapperDto.self, from: data)
                
                let movies = wrapperDto.movies.map { movieDto in
                    Movie(id: movieDto.id,
                          title: movieDto.title,
                          overview: movieDto.overview,
                          posterPath: "https://image.tmdb.org/t/p/w500\(movieDto.posterPath ?? "")")
                }
                completion(movies, nil)

            } catch (let error) {
                completion(nil, "Error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
        
    }
    
    
}
