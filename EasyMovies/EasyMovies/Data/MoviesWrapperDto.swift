//
//  MoviesWrapperDto.swift
//  EasyMovies
//
//  Created by Alumno on 10/10/25.
//



struct MoviesWrapperDto: Decodable {
    let movies: [MovieDto]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct MovieDto: Decodable {
    let id: Int
    let title: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case overview
    }
}
