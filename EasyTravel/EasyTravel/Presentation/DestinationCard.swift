//
//  DestinationCard.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//

import SwiftUI

struct DestinationCard: View {
    let destination: Destination
    
    var body: some View {
        VStack (alignment: .leading) {
            DestinationImage(url: destination.posterPath)
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
