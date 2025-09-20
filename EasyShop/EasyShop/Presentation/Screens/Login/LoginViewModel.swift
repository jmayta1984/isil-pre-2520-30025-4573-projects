//
//  LoginViewModel.swift
//  EasyShop
//
//  Created by Alumno on 19/09/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var user: User? = nil
    
    
    func login() {
        user = User(username: "jdoe", name: "John Doe",
                    email: "jdoe@example.com", image: "https://static.vecteezy.com/system/resources/previews/041/642/170/non_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png")
    }
    
    func logout() {
        user = nil
    }
}
