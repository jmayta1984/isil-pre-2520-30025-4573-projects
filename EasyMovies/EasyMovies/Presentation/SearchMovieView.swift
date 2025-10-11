//
//  SearchMovieView.swift
//  EasyMovies
//
//  Created by Alumno on 10/10/25.
//

import SwiftUI

struct SearchMovieView: View {
    @StateObject var viewModel = SearchMovieViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search any movies", text: $viewModel.query)
            }
            .padding(.horizontal)
            
            List {
                ForEach(viewModel.movies) { movie in
                    MovieCard(movie: movie)
                }
            }
            
        }
    }
}

#Preview {
    SearchMovieView()
}

