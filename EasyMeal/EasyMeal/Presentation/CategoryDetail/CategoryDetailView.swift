//
//  CategoryDetailView.swift
//  EasyMeal
//
//  Created by Alumno on 14/11/25.
//

import SwiftUI

struct CategoryDetailView: View {
    let category: Category
    
    @StateObject var viewModel = CategoryDetailViewModel()
    
    var body: some View {

        
        VStack {
            List {
                
                AsyncImage(url: URL(string: category.posterPath)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                        
                    case .failure(let error):
                        Text(error.localizedDescription)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .listRowSeparator(.hidden)

                HStack {
                    Text(category.description)
                }
                .listRowSeparator(.hidden)

                .padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                
                Group {
                    if let message = viewModel.message {
                        Text(message)
                    }
                }
                Section {
                    ForEach(viewModel.meals) { meal in
                        MealCard(meal: meal)
                    }
                    .listRowSeparator(.hidden)
                }
                .padding(.horizontal)

               
            }
            
            .listStyle(.plain)
        }
        
        
        .navigationTitle(category.name)
        .onAppear {
            viewModel.getMealsByCategory(category: category.name)
        }
    }
}
