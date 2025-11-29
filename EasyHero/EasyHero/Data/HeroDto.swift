//
//  HeroDto.swift
//  EasyHero
//
//  Created by Alumno on 28/11/25.
//

import Foundation

struct HeroesWrapperDto: Decodable {
    let heroes: [HeroDto]
    
    enum CodingKeys: String, CodingKey {
        case heroes = "results"
    }
}

struct HeroDto: Decodable {
    let id: String
    let name: String
    let powerstats: PowerStatsDto
    let biography: BiographyDto
    let image: ImageDto
}

struct PowerStatsDto: Decodable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}

struct BiographyDto: Decodable {
    let fullname: String
    
    enum CodingKeys: String, CodingKey {
        case fullname = "full-name"
    }
}

struct ImageDto: Decodable {
    let url: String
}

extension HeroDto {
    
    func toDomain() -> Hero {
        Hero(id: id,
             name: name,
             fullName: biography.fullname,
             posterPath: image.url,
             intelligence: Int(powerstats.intelligence) ?? 0,
             strength: Int(powerstats.strength) ?? 0,
             speed: Int(powerstats.speed) ?? 0,
             durability: Int(powerstats.durability) ?? 0,
             power: Int(powerstats.power) ?? 0,
             combat: Int(powerstats.combat) ?? 0)
    }
}
