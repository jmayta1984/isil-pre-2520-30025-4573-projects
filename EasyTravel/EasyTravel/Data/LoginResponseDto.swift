//
//  LoginResponseDto.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

struct LoginResponseDto: Decodable {
    let token: String
    let firstName: String
    let lastName: String
    let email: String
}
