//
//  EasyMapsApp.swift
//  EasyMaps
//
//  Created by Alumno on 21/11/25.
//

import SwiftUI

@main
struct EasyMapsApp: App {
    let googleMapHelper = GoogleMapHelper.shared
    var body: some Scene {
        WindowGroup {
            StoreListView()
        }
    }
}
