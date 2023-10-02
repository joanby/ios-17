//
//  DraggableView.swift
//  F15-Gestos
//
//  Created by Juan Gabriel Gomila Salas on 2/10/23.
//

import SwiftUI

struct DraggableView<Content>: View where Content: View {
    
    var content: () -> Content
    
    @GestureState private var dragState = DragState.inactive
    @State private var currentPosition = CGSize.zero
   
    
    var body: some View {
        content()
            .opacity(self.dragState.isTapped ? 0.5 : 1.0)
            .offset(x: self.currentPosition.width + self.dragState.translation.width,
                    y: self.currentPosition.height + self.dragState.translation.height)
            .animation(.easeInOut, value: self.dragState.translation)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .sequenced(before: DragGesture())
                    .updating(self.$dragState, body: { value, state, transaction in
                        switch value{
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation:drag?.translation ?? .zero)
                        default:
                            break
                        }
                    })
                    .onEnded({ value in
                        guard case .second(true, let drag?) = value else { return }
                        self.currentPosition.height += drag.translation.height
                        self.currentPosition.width += drag.translation.width
                    })
            )
        
    }
}

#Preview {
    DraggableView() {
        Circle()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            .foregroundStyle(.teal)
    }
}
