//
//  HomeView.swift
//  EasyMeal
//
//  Created by Alumno on 7/11/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        ScrollView {
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $viewModel.query)
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            ScrollView {
                HStack {
                    ForEach(viewModel.categories) { category in
                        CategoryFilter(category: category)
                    }
                }
            }
            
        }
    }
}

struct CategoryFilter: View {
    let category: Category
    var body: some View {
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
        .frame(width: 40, height: 40)
        .clipShape(Circle())
    }
}

#Preview {
    HomeView()
}
