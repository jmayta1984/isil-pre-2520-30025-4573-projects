//
//  DestinationsWrapperDto.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//

import Foundation

struct DestinationsWrapperDto: Decodable {
    let destinations: [DestinationDto]
    
    enum CodingKeys: String, CodingKey {
        case destinations = "results"
    }
}


struct DestinationDto: Decodable {
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath
        case overview
    }
}


