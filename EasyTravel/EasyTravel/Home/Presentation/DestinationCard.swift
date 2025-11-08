//
//  DestinationCard.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//

import SwiftUI

struct DestinationCard: View {
    let destination: Destination
    @EnvironmentObject var favoriteListViewModel: FavoriteListViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            ZStack (alignment: .topTrailing){
                DestinationImage(url: destination.posterPath)
                Button {
                    favoriteListViewModel.addFavorite(destination: destination)
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .scaledToFit()
                        .padding()
                }
                .buttonStyle(.plain)
                

            }
            VStack  (alignment: .leading){
                Text(destination.title).font(.headline)
                Text(destination.overview).font(.subheadline)
            }
            .padding(8)
            
            
        }
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
