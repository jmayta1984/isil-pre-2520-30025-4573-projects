//
//  RegisterViewModel.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var message = ""
    @Published var showAlert = false
    @Published var success = false
    
    func register(){
        let service = AuthService.shared
        
        service.register(requestDto: RegisterRequestDto(firstName: firstName, lastName: lastName, email: email, password: password)) { success, message in
            
            DispatchQueue.main.async {
                self.message = message
                self.success = success
                self.showAlert.toggle()
            }
        }
        
    }
}
