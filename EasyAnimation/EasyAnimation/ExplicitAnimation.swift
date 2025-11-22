//
//  ExplicitAnimation.swift
//  EasyAnimation
//
//  Created by Alumno on 21/11/25.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State var move = false
    var body: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .offset(x: move ? 100 : 0)
            .onTapGesture {
                withAnimation(.linear(duration: 2)) {
                    move.toggle()
                }
            }
        
        
        
    }
}

#Preview {
    ExplicitAnimation()
}
