//
//  BannerCard.swift
//  EasyShop
//
//  Created by Alumno on 19/09/25.
//

import SwiftUI

struct BannerCard: View {
    var body: some View {
        HStack {
            VStack {
                Text("Get your special sale up to 40%")
                    .foregroundStyle(.background)
                    .font(.title2)
                    .bold()
                    .padding(.horizontal,32)
                
                Button(action: {}) {
                    Text("Shop now")
                        .padding(.vertical,12)
                        .padding(.horizontal)
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
        .background(
            LinearGradient(colors: [.blue, .blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
