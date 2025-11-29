//
//  ApiError.swift
//  EasyHero
//
//  Created by Alumno on 28/11/25.
//

enum ApiError: Error {
    case invalidUrl
    case noData
    case serverError
    case decodingError
    case custom(message: String)
    case unknown
    
    var message: String {
        switch self {
        case .invalidUrl:
            return "Cannot create URL"
        case .noData:
            return "No data found"
        case .serverError:
            return "Server return an error"
        case .decodingError:
            return "Failed to process received data"
        case .custom(let message):
            return message
        case .unknown:
            return "An unexpected error ocurred."
        }
    }
}
