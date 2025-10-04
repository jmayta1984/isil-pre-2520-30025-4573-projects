//
//  MainView.swift
//  EasyShop
//
//  Created by Alumno on 5/09/25.
//

import SwiftUI

struct MainView: View {
 
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            Tab("Home", systemImage: "house", value: 0) {
                HomeView()
            }
            
            Tab("Favorites", systemImage: "heart", value: 1) {
                FavoriteView()
            }
            
            Tab("Cart", systemImage: "cart", value: 2) {
                CartView()

            }
            
            Tab("Profile", systemImage: "person", value: 3) {
                
            }
        }
        .tint(.primary)
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
}
