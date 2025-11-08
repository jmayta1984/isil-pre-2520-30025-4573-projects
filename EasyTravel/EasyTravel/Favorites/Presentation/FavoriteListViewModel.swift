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
        getAllFavorites()
    }
    
    func removeFavorite(destination: Destination) {
        dao.delete(id: destination.id)
        getAllFavorites()
    }
    
    func toggleFavorite(destination: Destination) {
        if isFavorite(id: destination.id)  {
            removeFavorite(destination: destination)
        } else {
            addFavorite(destination: destination)
        }
    }
    
    func getAllFavorites() {
        favorites = dao.fetchAll()
    }
    
    func isFavorite(id: Int) -> Bool {
        return favorites.contains { $0.id == id }
    }
    
    init () {
        getAllFavorites()
    }
}
