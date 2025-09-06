//
//  Main.swift
//  EasyShop
//
//  Created by Alumno on 5/09/25.
//

import SwiftUI

struct Main: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                Home()
            }
            
            Tab("Favorites", systemImage: "heart") {
                
            }
            
            Tab("Cart", systemImage: "cart") {
                
            }
            
            Tab("Profile", systemImage: "person") {
                
            }
        }
    }
}

#Preview {
    Main()
}
