//
//  FavoriteListView.swift
//  EasyTravel
//
//  Created by Alumno on 7/11/25.
//

import SwiftUI

struct FavoriteListView: View {
    
    @EnvironmentObject var viewModel: FavoriteListViewModel
    var body: some View {
        List {
            ForEach(viewModel.favorites) { favorite in
                FavoriteCard(favorite: favorite)
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.removeFavorite(destination: favorite)
                        } label: {
                            Label("Remove", systemImage: "trash")
                        }

                    }
                
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.getAllFavorites()
        }
    }
}
