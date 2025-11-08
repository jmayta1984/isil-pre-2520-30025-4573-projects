//
//  LoginView.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    @EnvironmentObject var appRouterViewModel: AppRouterViewModel
    
    @State var isVisible = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Email", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding()
                    .frame(height: 52)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                
                HStack {
                    Group {
                        if isVisible {
                            TextField("Password", text: $viewModel.password)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                        } else {
                            SecureField("Password", text: $viewModel.password)
                        }
                    }
                    
                    Button {
                        isVisible.toggle()
                    } label: {
                        Image(systemName: isVisible ? "eye" : "eye.slash")
                            .tint(Color(uiColor: .label))
                    }
                }
                .padding()
                .frame(height: 52)
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                Button {
                    viewModel.signin()
                } label: {
                    Text("Sign in")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(uiColor: .label))
                        .foregroundStyle(Color(uiColor: .systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                        .padding(.horizontal)
                }
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Sign up")
                        .tint(Color(uiColor: .label))
                }

                
                
            }
            .onChange(of: viewModel.user) { oldValue, newValue in
                if let user = newValue {
                    appRouterViewModel.login(user: user)
                }
            }
        }
       
    }
}

#Preview {
    LoginView()
}
