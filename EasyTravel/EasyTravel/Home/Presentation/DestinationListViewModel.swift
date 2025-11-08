//
//  DestinationListViewModel.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//



import Foundation

class DestinationListViewModel: ObservableObject {
    @Published var destinations: [Destination] = []
    @Published var selectedCategory: Category = .all
    
    func onCategoryChanged(category: Category) {
        selectedCategory = category
        getDestinations()
    }
    
    private func getDestinations() {
        let service = DestinationService.shared
        
        let category = selectedCategory == .all ? "": selectedCategory.rawValue
        
        service.getDestinations(category: category) { destinations, message in
            
            DispatchQueue.main.async {
                if let destinations = destinations {
                    self.destinations = destinations
                }
            }
        }
    }
    
    init() {
        getDestinations()
    }
    
}

