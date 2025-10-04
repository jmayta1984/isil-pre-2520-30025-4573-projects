//
//  ProductDto.swift
//  EasyStore
//
//  Created by Alumno on 3/10/25.
//

struct ProductsWrapperDto: Decodable {
    let products: [ProductDto]
}

struct ProductDto: Decodable {
    let id: Int
    let title: String
    let description: String
    let thumbnail: String
}


