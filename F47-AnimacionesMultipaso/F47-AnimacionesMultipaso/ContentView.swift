//
//  ContentView.swift
//  F47-AnimacionesMultipaso
//
//  Created by Juan Gabriel Gomila Salas on 3/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 180)
            .phaseAnimator([false, true]) { content, phase in
                content
                    .scaleEffect(phase ? 1.0 : 0.6)
                    .foregroundStyle(phase ? .indigo : .teal )
                    .rotation3DEffect(
                        phase ? .degrees(1080) : .zero,
                                              axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
            } animation: { phase in
                switch phase {
                case true:
                        .spring
                case false:
                        .smooth(duration: 2.5)
                }
            }
    }
}

#Preview {
    ContentView()
}
