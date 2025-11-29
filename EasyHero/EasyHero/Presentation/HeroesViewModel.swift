//
//  HeroListViewModel.swift
//  EasyHero
//
//  Created by Alumno on 28/11/25.
//

import Foundation

class HeroesViewModel: ObservableObject {
    @Published var uiState = UiState()
    
    let service = HeroService.shared
    
    func searchHeroes(by query: String) {
        uiState = uiState.copyWith(status: .loading)
        
        service.searchHeroes(by: query) { result in
            switch result {
            case .success(let heroes):
                DispatchQueue.main.async {
                    self.uiState = self.uiState.copyWith(status: .success, heroes: heroes)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.uiState = self.uiState.copyWith(status: .failure, message: error.message)
                }
            }
        }
    }
    
}
