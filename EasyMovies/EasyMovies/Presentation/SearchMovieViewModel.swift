//
//  SearchMovieViewModel.swift
//  EasyMovies
//
//  Created by Alumno on 10/10/25.
//

import Foundation

class SearchMovieViewModel: ObservableObject {
    @Published var movies:[Movie] = []
    @Published var error:String = ""
    
    @Published var query: String = ""
    
    func searchMovie() {
        let service = MovieService.shared
        
        service.searchMovies(query: query) { movies, error in
            DispatchQueue.main.async {
                if let movies = movies {
                    self.movies = movies
                    print(movies.count)
                }
                if let error = error {
                    self.error = error
                    print(error)
                }
                
            }
        }
    }
    
}
