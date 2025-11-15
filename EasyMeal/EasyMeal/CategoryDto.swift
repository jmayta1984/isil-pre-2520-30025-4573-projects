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
    let description: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case posterPath =  "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}

struct CategoriesWrapperDto: Decodable {
    let categories: [CategoryDto]
}
