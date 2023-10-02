//
//  ScalableView.swift
//  F15-Gestos
//
//  Created by Juan Gabriel Gomila Salas on 2/10/23.
//

import SwiftUI

struct ScalableView<Content>: View where Content: View {
    
    @GestureState private var scaleFactor: CGFloat = 1.0
    var content: () -> Content
    var body: some View {
        content()
            .scaleEffect(scaleFactor)
            .animation(.easeInOut, value: scaleFactor)
            .gesture(
                MagnifyGesture()
                    .updating(self.$scaleFactor, body: { value, state, transaction in
                        state = value.magnification
                    })
            )
    }
}

#Preview {
    ScalableView(){
        Image(systemName: "apple.logo")
            .font(.system(size: 150))
            .foregroundStyle(.teal)
    }
}
