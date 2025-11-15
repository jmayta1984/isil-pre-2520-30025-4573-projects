//
//  MealDto.swift
//  EasyMeal
//
//  Created by Alumno on 14/11/25.
//

struct MealDto: Decodable {
    let id: String?
    let name: String?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case posterPath = "strMealThumb"
    }
 
}

struct MealsWrapperDto: Decodable {
    let meals: [MealDto]
}

extension MealDto {
    func toDomain() -> Meal {
        Meal(id: self.id ?? "", name: self.name ?? "", posterPath: self.posterPath ?? "")
    }
}
