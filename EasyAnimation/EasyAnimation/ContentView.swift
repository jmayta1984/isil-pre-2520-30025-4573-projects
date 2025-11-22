//
//  ContentView.swift
//  EasyAnimation
//
//  Created by Alumno on 21/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Implicit", systemImage: "circle"){
                ImplicitAnimation()
            }
            
            Tab("Explicit", systemImage: "rectangle"){
                ExplicitAnimation()
            }
            
            Tab("Transition", systemImage: "rectangle"){
                TransitionAnimation()
            }
            
            Tab("Infinite", systemImage: "arrow.2.circlepath"){
                InfiniteAnimation()
            }
        }
    }
}

#Preview {
    ContentView()
}
