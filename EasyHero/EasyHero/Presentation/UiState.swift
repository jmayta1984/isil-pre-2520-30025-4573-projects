//
//  UiState.swift
//  EasyHero
//
//  Created by Alumno on 28/11/25.
//

struct UiState {
    let status: Status
    let heroes: [Hero]
    let message: String?
    
    init() {
        status = .initial
        heroes = []
        message = nil
    }
    
    private init(status: Status, heroes: [Hero], message: String? = nil ) {
        self.status = status
        self.heroes = heroes
        self.message = message
    }
    
    func copyWith(
        status: Status? = nil,
        heroes: [Hero]? = nil,
        message: String? = nil
    )  -> UiState {
        UiState(status: status ?? self.status,
                heroes: heroes ?? self.heroes,
                message: message ?? self.message)
    }
}
