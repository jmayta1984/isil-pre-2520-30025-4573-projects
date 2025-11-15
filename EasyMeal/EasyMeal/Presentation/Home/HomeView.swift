//
//  HomeView.swift
//  EasyMeal
//
//  Created by Alumno on 7/11/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State var selectedCategory: Category?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing: 16) {
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
                                    .onTapGesture {
                                        selectedCategory = category
                                    }
                            }
                        }
                        .padding(.horizontal, 8)
                        
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .navigationTitle("Easy Meal")
            .onAppear {
                viewModel.getAllCategories()
            }
            .navigationDestination(item: $selectedCategory) { category in
                CategoryDetailView(category: category)
            }
        }
    }
}



#Preview {
    HomeView()
}
