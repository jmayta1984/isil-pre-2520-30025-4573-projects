//
//  TransitionAnimation.swift
//  EasyAnimation
//
//  Created by Alumno on 21/11/25.
//

import SwiftUI

struct TransitionAnimation: View {
    @State var show = false
    
    var body: some View {
        VStack {
            if show {
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                    .transition(.scale)
                    
            }
            Button("Show") {
                withAnimation(.linear) {
                    show.toggle()
                }
                
            }
        }
    }
}


#Preview {
    TransitionAnimation()
}
