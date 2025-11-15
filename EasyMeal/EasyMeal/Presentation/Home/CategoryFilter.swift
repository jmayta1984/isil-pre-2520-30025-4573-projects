//
//  CategoryFilter.swift
//  EasyMeal
//
//  Created by Alumno on 14/11/25.
//

import SwiftUI

struct CategoryFilter: View {
    let category: Category
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: category.posterPath)) { phase in
                switch(phase) {
                case .success(let  image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure(let error):
                    Text(error.localizedDescription)
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 96, height: 96)
            .clipShape(Circle())
            
            Text(category.name).fontWeight(.semibold)
        }
        
    }
}
