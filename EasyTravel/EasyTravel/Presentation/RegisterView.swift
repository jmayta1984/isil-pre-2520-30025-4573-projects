//
//  RegisterView.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()

    @Environment(\.dismiss) var dismiss
    @State var isVisible = false
    
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("First name", text: $viewModel.firstName)
                .autocorrectionDisabled()
                .padding()
                .frame(height: 52)
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            TextField("Last name", text: $viewModel.lastName)
                .autocorrectionDisabled()
                .padding()
                .frame(height: 52)
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
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
                viewModel.register()
            } label: {
                Text("Register")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .label))
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .padding(.horizontal)
            }
       
            
        }
        .alert("Message", isPresented: $viewModel.showAlert) {
            Button(action: {
                if (viewModel.success) {
                    dismiss()
                }
            }) {
                Text("OK")
            }
        } message: {
            Text(viewModel.message)
        }

    }
}

#Preview {
    RegisterView()
}
