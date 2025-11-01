//
//  EasyInventoryApp.swift
//  EasyInventory
//
//  Created by Alumno on 31/10/25.
//

import SwiftUI
import SwiftData

@main
struct EasyInventoryApp: App {


    var body: some Scene {
        WindowGroup {
           ProductListView()
        }
        .modelContainer(for: Product.self)
    }
}
