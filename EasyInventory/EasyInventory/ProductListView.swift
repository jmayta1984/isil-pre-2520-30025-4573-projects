//
//  ProductListView.swift
//  EasyInventory
//
//  Created by Alumno on 31/10/25.
//
import SwiftUI
import SwiftData

struct ProductListView: View {
    @Environment(\.modelContext) var context
    @Query var products: [Product]
    @State var showNewProduct = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(products) { product in
                    VStack {
                        Text(product.name)
                        Text("\(product.quantity)")
                    }
                }
            }
            .navigationTitle("EasyInventory")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        context.insert(Product(name: "prueba", quantity: 1))
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $showNewProduct) {
                ProductDetailView { product in
                    context.insert(product)
                }
            }
        }
    }
}

