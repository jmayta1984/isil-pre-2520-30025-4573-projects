//
//  EasyTravelApp.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//

import SwiftUI

@main
struct EasyTravelApp: App {
    @StateObject var appRouterViewModel = AppRouterViewModel()
    @StateObject var favoriteListViewModel = FavoriteListViewModel()

    var body: some Scene {
        WindowGroup {
            AppRouterView()
                .environmentObject(appRouterViewModel)
                .environmentObject(favoriteListViewModel)
        }
    }
}
