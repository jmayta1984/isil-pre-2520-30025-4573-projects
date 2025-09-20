//
//  LoginView.swift
//  EasyShop
//
//  Created by Alumno on 5/09/25.
//

import SwiftUI

struct LoginView: View {
    
    @State var username = ""
    @State var password = ""
    @State var isVisible = false
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username", text: $username )
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
                
                HStack {
                    if (isVisible) {
                        TextField("Password", text: $password)
                            .padding()
                    } else {
                        SecureField("Password", text: $password)
                            .padding()
                    }
                    
                    
                    Button(action: {
                        isVisible.toggle()
                    }) {
                        Image(systemName: isVisible ? "eye" : "eye.slash")
                    }
                    
                    
                }
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
                
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Sign in")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, 8)
                    
                }
            }
            .navigationDestination(item: $viewModel.user) { user in
                MainView()
                    .navigationBarBackButtonHidden()
            }
        }
        .tint(.primary)
    }
}

#Preview {
    LoginView()
}
