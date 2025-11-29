//
//  HeroCard.swift
//  EasyHero
//
//  Created by Alumno on 28/11/25.
//

import SwiftUI

struct HeroCard: View {
    let hero: Hero
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: hero.posterPath)) { phase in
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
            .frame(width: 80, height: 80)
            
            VStack(alignment: .leading) {
                Text(hero.name)
                Text(hero.fullName)
            }
        }
    }
}
