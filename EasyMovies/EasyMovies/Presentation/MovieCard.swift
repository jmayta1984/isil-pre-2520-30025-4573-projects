//
//  MovieCard.swift
//  EasyMovies
//
//  Created by Alumno on 10/10/25.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        
        HStack {
            MovieImage(path: movie.posterPath)
            VStack {
                Text(movie.title).lineLimit(1)
                Text(movie.overview).lineLimit(2)
            }
        }
    }
}

struct MovieImage: View {
    let path: String
    
    var body: some View {
        
        AsyncImage(url: URL(string: path)) { image in
            image
                .resizable()
                .frame(height: 120)
                .frame(width: 60)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        } placeholder: {
            ProgressView()
                .frame(height: 120)
                .frame(width: 60)
        }

    }
    
}
