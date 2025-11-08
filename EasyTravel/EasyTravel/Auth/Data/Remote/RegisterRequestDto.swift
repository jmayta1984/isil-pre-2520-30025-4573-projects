//
//  RegisterRequestDto.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

import Foundation

struct RegisterRequestDto: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
