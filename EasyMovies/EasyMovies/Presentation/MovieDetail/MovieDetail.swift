//
//  MovieDetail.swift
//  EasyMovies
//
//  Created by Alumno on 10/10/25.
//


import SwiftUI

struct MovieDetail: View {
    let movie: Movie
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: movie.posterPath)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 320)
                        .frame(maxWidth: .infinity)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(height: 320)
                        .frame(maxWidth: .infinity)
                }
                VStack (alignment: .leading){
                    Text(movie.title).font(.largeTitle).bold()
                    Text("Overview")
                    Text(movie.overview)
                }.padding(.horizontal)
               
                
            }
        }
        
    }
}
