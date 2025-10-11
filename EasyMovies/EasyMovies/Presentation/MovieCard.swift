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
        
        HStack (alignment: .top) {
            MovieImage(path: movie.posterPath)
            VStack(alignment: .leading) {
                Text(movie.title).bold().lineLimit(1)
                Text(movie.overview).lineLimit(2)
            }
        }
        .frame(height: 136)
    }
}

struct MovieImage: View {
    let path: String
    
    var body: some View {
        
        AsyncImage(url: URL(string: path)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(height: 136)
                .frame(width: 90)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        } placeholder: {
            ProgressView()
                .frame(height: 136)
                .frame(width: 90)
        }

    }
    
}
