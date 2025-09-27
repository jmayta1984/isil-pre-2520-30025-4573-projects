//
//  EasyShopApp.swift
//  EasyShop
//
//  Created by Alumno on 5/09/25.
//

import SwiftUI

@main
struct EasyShopApp: App {
    @StateObject var cartViewModel = CartViewModel()
    @StateObject var homeViewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(cartViewModel)
                .environmentObject(homeViewModel)
        }
    }
}
