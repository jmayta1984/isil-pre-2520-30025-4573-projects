//
//  DestinationListViewModel.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//



import Foundation

class DestinationListViewModel: ObservableObject {
    @Published var destinations: [Destination] = []
    
    func getDestinations() {
        
    }
    
}

