//
//  LoginViewModel.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var message = ""
    @Published var user: User?
    
    func signin(){
        let service = AuthService.shared
        
        service.signin(requestDto: LoginRequestDto(email: email, password: password)) { user, message in
            DispatchQueue.main.async {
                self.message = message
                self.user = user
            }
        }
    }
}
        
   
