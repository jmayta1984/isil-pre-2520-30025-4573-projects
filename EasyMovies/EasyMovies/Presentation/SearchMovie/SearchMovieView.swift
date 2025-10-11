//
//  SearchMovieView.swift
//  EasyMovies
//
//  Created by Alumno on 10/10/25.
//

import SwiftUI

struct SearchMovieView: View {
    @StateObject var viewModel = SearchMovieViewModel()
    
    @State var selectedMovie: Movie? = nil
    
    var body: some View {
        NavigationStack {
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
                            .onTapGesture {
                                selectedMovie = movie
                            }
                    }
                }
                .listStyle(.plain)
                
            }
            .navigationDestination(item: $selectedMovie) { movie in
                MovieDetail(movie: movie)
            }
        }
        
        
    }
}

#Preview {
    SearchMovieView()
}

