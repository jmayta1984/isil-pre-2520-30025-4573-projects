//
//  MealCard.swift
//  EasyMeal
//
//  Created by Alumno on 14/11/25.
//

import SwiftUI

struct MealCard: View {
    let meal: Meal
    
    @State var showOptions = false
    @State var isFavorite = false
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.posterPath)) { phase in
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
            .frame(width: 32, height: 32)
            .clipShape(Circle())
            
            Text(meal.name).lineLimit(1)
            Spacer()
            if (isFavorite) {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
            
            
            Button {
                showOptions.toggle()
            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .tint(.primary)
            }
            .buttonStyle(.borderless)

        }
        .sheet(isPresented: $showOptions) {
            VStack (alignment: .leading){
                Button {
                    isFavorite.toggle()
                    showOptions.toggle()
                } label: {
                    Label("Add to favorites", systemImage: "heart.fill")
                        .tint(.primary)
                }

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .presentationDetents([.fraction(0.1)])
        }

    }
}
