//
//  RegisterView.swift
//  EasyTravel
//
//  Created by Alumno on 24/10/25.
//

import SwiftUI

struct RegisterView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var isVisible = false
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("First name", text: $firstName)
                .autocorrectionDisabled()
                .padding()
                .frame(height: 52)
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            TextField("Last name", text: $lastName)
                .autocorrectionDisabled()
                .padding()
                .frame(height: 52)
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            TextField("Email", text: $email)
                .autocorrectionDisabled()
                .padding()
                .frame(height: 52)
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            HStack {
                Group {
                    if isVisible {
                        TextField("Password", text: $password)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                    } else {
                        SecureField("Password", text: $password)
                    }
                }
                
                Button {
                    isVisible.toggle()
                } label: {
                    Image(systemName: isVisible ? "eye.slash" : "eye")
                        .tint(Color(uiColor: .label))
                }
            }
            .padding()
            .frame(height: 52)
            .background(Color(uiColor: .secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)
            
            Button {
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
    }
}

#Preview {
    RegisterView()
}
