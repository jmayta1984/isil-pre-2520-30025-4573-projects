//
//  Product.swift
//  EasyShop
//
//  Created by Alumno on 12/09/25.
//

struct Product: Identifiable, Hashable {
    let id: Int
    let name: String
    let price: Double
    let image: String
    let sizes: [String]
}

