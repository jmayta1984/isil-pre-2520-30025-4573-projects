//
//  AppRouterView.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

import SwiftUI

struct AppRouterView: View {
    
    @EnvironmentObject var viewModel: AppRouterViewModel
    
    var body: some View {
        
        Group {
            if viewModel.user != nil {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}
