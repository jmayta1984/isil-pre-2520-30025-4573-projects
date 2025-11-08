//
//  FavoriteListViewModel.swift
//  EasyTravel
//
//  Created by Alumno on 7/11/25.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    @Published var favorites: [Destination] = []
    let dao = DestinationDao.shared
    
    func addFavorite(destination: Destination) {
        dao.insert(destination: destination)
    }
    
    func removeFavorite(destination: Destination) {
        dao.delete(id: destination.id)
    }
    
    func getAllFavorites() {
        favorites = dao.fetchAll()
    }
    
}
