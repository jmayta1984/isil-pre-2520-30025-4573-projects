//
//  LoginView.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()

    @State var isVisible = false
    
    var body: some View {
        VStack(spacing: 16) {
            

            TextField("Email", text: $viewModel.email)
                .autocorrectionDisabled()
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
            Group {
                if !viewModel.email.isEmpty {
                    Text(viewModel.message)
                }
            }
            
        }
    }
}

#Preview {
    LoginView()
}
