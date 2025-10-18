//
//  CategoryImage.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//
import SwiftUI

struct DestinationImage: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipped()
        } placeholder: {
            ProgressView()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
        }

    }
}
