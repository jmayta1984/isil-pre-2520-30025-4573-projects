//
//  StoreListView.swift
//  EasyMaps
//
//  Created by Alumno on 21/11/25.
//

import SwiftUI

struct StoreListView: View {
    @StateObject var viewModel = StoreListViewModel()
    
    @State var selectedStore: Store?
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.stores) { store in
                    Text(store.name)
                        .onTapGesture {
                            selectedStore = store
                        }
                }
            }
            .listStyle(.plain)
        }
        .sheet(item: $selectedStore) { store in
            GoogleMapView(store: store)
                .ignoresSafeArea()
                .presentationDetents([.fraction(0.85)])
        }
    }
}

