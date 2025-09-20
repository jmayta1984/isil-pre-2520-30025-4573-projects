//
//  CategoyPill.swift
//  EasyShop
//
//  Created by Alumno on 19/09/25.
//

import SwiftUI

struct CategoryPill: View {
    let name: String
    let isSelected: Bool
    var body: some View {
        Text(name)
            .font(.subheadline)
            .padding()
            .background(isSelected ? .blue : .gray.opacity(0.1))
            .foregroundStyle(isSelected ? .white :  .primary)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
