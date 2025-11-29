//
//  HeroesView.swift
//  EasyHero
//
//  Created by Alumno on 28/11/25.
//

import SwiftUI

struct HeroesView: View {
    @State var query = ""
    @StateObject var viewModel = HeroesViewModel()
    
    var body: some View {
        List {
            Section {
                TextField("Search", text: $query, onCommit: {
                    viewModel.searchHeroes(by: query)
                })
            }
          
            
            switch viewModel.uiState.status {
            case .initial:
                EmptyView()
            case .loading:
                ProgressView()
            case .success:
                
                ForEach(viewModel.uiState.heroes) { hero in
                    HeroCard(hero: hero)
                }
                
            case .failure:
                Text(viewModel.uiState.message ?? "Unknown error")
            }
        }
        
    }
}
