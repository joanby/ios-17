//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Juan Gabriel Gomila Salas on 2/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isTapped = false
    @GestureState private var longPress = false
    
    var body: some View {
        Image(systemName: "book.circle.fill")
            .font(.system(size: 200))
            .foregroundStyle(.teal)
            .opacity(self.longPress ? 0.5 : 1.0)
            .scaleEffect(self.isTapped ? 0.5 : 1.0)
            .animation(.bouncy, value: self.isTapped)
            .gesture(
                //TapGesture()
                LongPressGesture(minimumDuration: 1.0)
                    .updating(self.$longPress, body: { (currentState, state, transaction)in
                        state = currentState
                    })
                    .onEnded({ _ in
                        self.isTapped.toggle()
                    })
            )
        
    }
}

#Preview {
    ContentView()
}
