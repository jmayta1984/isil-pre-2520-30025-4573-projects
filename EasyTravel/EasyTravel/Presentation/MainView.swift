//
//  MainView.swift
//  EasyTravel
//
//  Created by Alumno on 7/11/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                DestinationListView()
            }
            Tab("Favorites", systemImage: "heart") {
                FavoriteListView()
            }
        }.tint(Color(uiColor: .label))
    }
}
