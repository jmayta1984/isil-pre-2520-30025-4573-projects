//
//  EasyTravelApp.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//

import SwiftUI

@main
struct EasyTravelApp: App {
    @StateObject var viewModel = AppRouterViewModel()

    var body: some Scene {
        WindowGroup {
            AppRouterView()
                .environmentObject(viewModel)
        }
    }
}
