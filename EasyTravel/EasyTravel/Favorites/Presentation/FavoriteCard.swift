//
//  FavoriteCard.swift
//  EasyTravel
//
//  Created by Alumno on 7/11/25.
//

import SwiftUI

struct FavoriteCard: View {
    let favorite: Destination
    var body: some View {
        HStack (spacing: 0){
            AsyncImage(url: URL(string: favorite.posterPath)) { phase in
                switch(phase) {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .empty:
                    ProgressView()
                case .failure(let error):
                    Text(error.localizedDescription)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            VStack(alignment: .leading) {
                Text(favorite.title).font(.headline)
                Text(favorite.overview).lineLimit(1)
            }.padding(.horizontal, 8)
            
        }
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
