//
//  SearchMovieViewModel.swift
//  EasyMovies
//
//  Created by Alumno on 10/10/25.
//

import Foundation

class SearchMovieViewModel: ObservableObject {
    @Published var movies:[Movie] = []
    @Published var query: String = ""
    
    func searchMovie() {
        
    }
    
}
