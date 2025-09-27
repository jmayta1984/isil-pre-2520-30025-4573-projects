//
//  MainView.swift
//  EasyShop
//
//  Created by Alumno on 5/09/25.
//

import SwiftUI

struct MainView: View {
 
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
                  

            }
            
            Tab("Favorites", systemImage: "heart") {
                FavoriteView()
            }
            
            Tab("Cart", systemImage: "cart") {
                CartView()

            }
            
            Tab("Profile", systemImage: "person") {
                
            }
        }
        .tint(.primary)
    }
}

#Preview {
    MainView()
}
