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
            .padding(.horizontal, 8)
            
            ScrollView(.horizontal) {
                
                HStack (spacing: 16) {
                    ForEach(viewModel.categories) { category in
                        CategoryFilter(category: category)
                    }
                }
                .padding(.horizontal, 8)
                
            }
            .scrollIndicators(.hidden)

            
        }
        .onAppear {
            viewModel.getAllCategories()
        }
    }
}

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

#Preview {
    HomeView()
}
