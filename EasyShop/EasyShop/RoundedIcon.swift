//
//  RoundedIcon.swift
//  EasyShop
//
//  Created by Alumno on 19/09/25.
//

import SwiftUI

struct RoundedIcon: View {
    let name: String
    let action: () -> Void
    
    var body: some View {
        
        Button {
           action()
        } label: {
            Image(systemName: name)
                .tint(.primary)
                .frame(width: 48, height: 48)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        }

        
    }
}

#Preview {
    RoundedIcon(name: "bell") { }
}
