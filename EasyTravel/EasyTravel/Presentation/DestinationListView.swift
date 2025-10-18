//
//  DestinationListView.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//

import SwiftUI

struct DestinationListView: View {
    @StateObject var viewModel = DestinationListViewModel()
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(Category.allCases, id: \.self) {
                            category in
                            CategoryChip(category: category.rawValue, isSelected: category == viewModel.selectedCategory)
                                .onTapGesture {
                                    viewModel.onCategoryChanged(category: category)
                                }
                        }
                        
                    }
                    .padding(.horizontal)

                }
                .scrollIndicators(.hidden)
                
                List {
                    ForEach(viewModel.destinations) { destination in
                        DestinationCard(destination: destination)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
          
            }
            
            
            .navigationTitle("Destinations")
        }
    }
}


#Preview {
    DestinationListView()
}


enum Category: String, CaseIterable {
    case all = "All"
    case adventure = "Adventure"
    case beach = "Beach"
    case city = "City"
    case cultural = "Cultural"
}
