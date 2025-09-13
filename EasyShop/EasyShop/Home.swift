//
//  Home.swift
//  EasyShop
//
//  Created by Alumno on 5/09/25.
//

import SwiftUI

struct Home: View {
    
    @State var search = ""
    @State var selectedCategory: Category = .all
    
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
                IconBadge(name: "bell")
                IconBadge(name: "cart")
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
                
                IconBadge(name: "slider.vertical.3")
            }
            .padding(.horizontal, 8)
            
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
            }
            .padding(.horizontal, 8)
            
            HStack {
                VStack {
                    Text("Get your special sale up to 40%")
                        .foregroundStyle(.background)
                        .font(.title2)
                        .bold()
                        .padding(.horizontal,32)
                    
                    Button(action: {}) {
                        Text("Shop now")
                            .padding()
                            .background(.background, in:
                                            RoundedRectangle(cornerRadius: 16))
                        
                    }
                }
                
                Image("banner")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 192)
            .clipped()
            .background(
                LinearGradient(colors: [.blue, .blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing), in: RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal,8)
            Spacer()
        }
    }
}

struct IconBadge: View {
    let name: String
    
    var body: some View {
        Image(systemName: name)
            .frame(width: 48, height: 48)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

struct CategoryPill: View {
    let name: String
    let isSelected: Bool
    var body: some View {
        Text(name)
            .font(.subheadline)
            .padding()
            .background(isSelected ? .blue : .gray.opacity(0.1))
            .foregroundStyle(isSelected ? .white :  .primary)
            .clipShape(RoundedRectangle(cornerRadius: 16))
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
    Home()
}
