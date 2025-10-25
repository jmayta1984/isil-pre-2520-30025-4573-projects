//
//  AppRouterViewModel.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

import Foundation

class AppRouterViewModel: ObservableObject {
    @Published var user: User?
    
    func login(user: User) {
        self.user = user
    }
    
    func logout() {
        self.user = nil
    }
}
