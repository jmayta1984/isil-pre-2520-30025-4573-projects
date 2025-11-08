//
//  CategoryChip.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//

import SwiftUI

struct CategoryChip: View {
    let category: String
    let isSelected: Bool
    var body: some View {
        VStack {
            Text(category)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(isSelected ? .black : .white)
                .foregroundStyle(isSelected ? .white : .gray)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
