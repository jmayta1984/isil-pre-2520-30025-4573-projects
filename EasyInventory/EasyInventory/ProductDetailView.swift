//
//  ProductDetailView.swift
//  EasyInventory
//
//  Created by Alumno on 31/10/25.
//

import SwiftUI
import SwiftData

struct ProductDetailView: View {
    @Environment(\.dismiss) var dismiss
    let save: (Product) -> Void
    @State var name: String = ""
    @State var quantity: Int = 0
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    TextField("Name", text: $name)
                    HStack {
                
                        Button {
                            quantity -= 1
                        } label: {
                            Image(systemName: "minus")
                                
                        }
                        .buttonStyle(.plain)
                        
                        Text("\(quantity)")
                        Button {
                            quantity += 1
                        } label: {
                            Image(systemName: "plus")
                        }
                        .buttonStyle(.plain)

                    }
                }
                
            }
            .navigationTitle("New product")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                        save(Product(name: name, quantity: quantity))
                    } label: {
                        Image(systemName: "checkmark")
                    }

                }
            }
        }
    }
}


