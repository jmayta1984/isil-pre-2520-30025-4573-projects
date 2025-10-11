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
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search any movies", text: $viewModel.query)
                    .onSubmit {
                        viewModel.searchMovie()
                    }
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            }
            .padding(.horizontal)
            
            List {
                ForEach(viewModel.movies) { movie in
                    MovieCard(movie: movie)
                }
            }
            .listStyle(.plain)
            
        }
        
        
    }
}

#Preview {
    SearchMovieView()
}

