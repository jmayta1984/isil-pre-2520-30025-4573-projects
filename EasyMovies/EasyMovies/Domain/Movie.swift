//
//  Movie.swift
//  EasyMovies
//
//  Created by Alumno on 10/10/25.
//

struct Movie: Identifiable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
}
