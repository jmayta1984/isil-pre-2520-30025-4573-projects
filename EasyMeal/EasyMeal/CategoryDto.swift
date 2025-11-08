//
//  CategoryDto.swift
//  EasyMeal
//
//  Created by Alumno on 7/11/25.
//

struct CategoryDto: Decodable {
    let id: String
    let name: String
    let posterPath: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "strCategory"
        case posterPath =  "strCategoryThumb"
    }
}

struct CategoriesWrapperDto: Decodable {
    let categories: [CategoryDto]
}
