//
//  DragView.swift
//  F15-Gestos
//
//  Created by Juan Gabriel Gomila Salas on 2/10/23.
//

import SwiftUI

struct DragView: View {
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var currentPosition = CGSize.zero
    
    var body: some View {
        Image(systemName: "book.circle.fill")
            .font(.system(size: 100))
            .foregroundStyle(.teal)
            // OX = P_x + v_x; OY = P_y +v_y
            .offset(x: self.currentPosition.width + self.dragOffset.width,
                    y: self.currentPosition.height + self.dragOffset.height)
            .animation(.easeInOut, value: self.dragOffset)
            .gesture(
                DragGesture()
                    .updating(self.$dragOffset, body: { value, state, transaction in
                        state = value.translation
                    })
                    .onEnded({ value in
                        self.currentPosition.height += value.translation.height
                        self.currentPosition.width += value.translation.width
                    })
            )
        
    }
}

#Preview {
    DragView()
}
