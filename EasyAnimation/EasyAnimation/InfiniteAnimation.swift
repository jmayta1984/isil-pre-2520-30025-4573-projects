//
//  InfiniteAnimation.swift
//  EasyAnimation
//
//  Created by Alumno on 21/11/25.
//

import SwiftUI

struct InfiniteAnimation: View {
    @State var rotate = false
    
    var body: some View {
        VStack {
            Image(systemName: "arrow.2.circlepath")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .rotationEffect(.degrees(rotate ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: rotate)
                .onTapGesture {
                    rotate.toggle()
                }
        }
    }
}

#Preview {
    InfiniteAnimation()
}
