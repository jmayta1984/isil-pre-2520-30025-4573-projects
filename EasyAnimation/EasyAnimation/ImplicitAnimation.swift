//
//  ImplicitAnimation.swift
//  EasyAnimation
//
//  Created by Alumno on 21/11/25.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State var change = false
    var body: some View {
        Circle()
            .fill(change ? .blue : .red)
            .frame(
                width: change ? 200 : 100,
                height: change ? 200 : 100)
            .offset(
                x: change ? 100 : 0,
                y: change ? 100 : 0
            )
            .animation(.linear(duration: 2), value: change)
            .onTapGesture {
                change.toggle()
            }
    }
}

#Preview {
    ImplicitAnimation()
}
