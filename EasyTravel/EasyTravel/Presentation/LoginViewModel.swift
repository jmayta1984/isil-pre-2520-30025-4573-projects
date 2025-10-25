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
    
    func signin(){
        let service = AuthService.shared
        
    }
}
        
   
