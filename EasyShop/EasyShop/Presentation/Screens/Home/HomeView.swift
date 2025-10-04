//
//  HomeView.swift
//  EasyShop
//
//  Created by Alumno on 5/09/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    @State var selectedCategory: Category = .all
    @State var selectedProduct: Product? = nil
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.blue)
                        .frame(width: 48, height: 48)
                    Image(systemName: "person.crop.circle.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                }
                VStack(alignment: .leading) {
                    Text("Hello Alex")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Text("Good morning!")
                        .font(.headline)
                    
                }
                Spacer()
                RoundedIcon(name: "bell") { }
                RoundedIcon(name: "cart") { }
            }
            .padding(.horizontal, 8)
            
            HStack {
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    TextField("Search", text: $search)
                }
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                RoundedIcon(name: "slider.vertical.3"){ }
            }
            .padding(.horizontal, 8)
            
            ScrollView(.vertical){
                HStack {
                    Text("Categories")
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text("See all")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 16)
                .padding(.horizontal, 8)
                
                ScrollView (.horizontal){
                    HStack {
                        ForEach(Category.allCases, id: \.self) { category in
                            CategoryPill(
                                name: category.rawValue,
                                isSelected: selectedCategory == category
                            )
                            .onTapGesture {
                                selectedCategory = category
                            }
                        }
                        
                    }
                    .padding(.horizontal, 8)
                    
                }
                .padding(.bottom)
                
                
                BannerCard().padding(.horizontal,8)
                
                HStack {
                    Text("Popular")
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text("See all")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 16)
                .padding(.horizontal, 8)
                
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]) {
                    ForEach(viewModel.products) { product in
                        ProductCard(product: product)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .onTapGesture {
                                selectedProduct = product
                            }
                    }
                }
            }
            
        }
        .navigationDestination(item: $selectedProduct) { product in
            ProductDetailView(product: product)
        }
    }
    
}


enum Category: String, CaseIterable {
    case all = "All"
    case men = "Men"
    case women = "Women"
    case boys = "Boys"
    case girls = "Girls"
}


#Preview {
    HomeView()
}
