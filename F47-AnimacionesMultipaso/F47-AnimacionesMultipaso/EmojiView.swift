//
//  EmojiView.swift
//  F47-AnimacionesMultipaso
//
//  Created by Juan Gabriel Gomila Salas on 3/2/24.
//

import SwiftUI


enum EmojiPhase: CaseIterable {
   
    case initial
    case rotate
    case jump
    case fall
    
    
    var scale: Double {
        switch self {
        case .initial: 1.0
        case .rotate: 1.5
        case .jump: 0.7
        case .fall: 0.5
        }
    }
    
    var angle: Angle {
        switch self {
        case .initial, .jump: Angle.zero
        case .rotate: Angle(degrees: 1080)
        case .fall: Angle(degrees: 360)
        }
    }
    
    var offset: Double {
        switch self {
        case .initial, .rotate: 0
        case .jump: -300.0
        case .fall: 400.0
        }
    }
    
    var anim: Animation {
        switch self {
        case .initial: .bouncy
        case .rotate: .snappy
        case .jump: .smooth
        case .fall: .interactiveSpring
        }
    }
    
}


struct EmojiView: View {
    
    @State private var startAnimation = false
    
    var body: some View {
        Text("🐸")
            .font(.system(size: 100))
            .phaseAnimator(EmojiPhase.allCases,
                           trigger: self.startAnimation) { content, phase in
                content
                    .scaleEffect(phase.scale)
                    .rotationEffect(phase.angle)
                    .offset(y:phase.offset)
            } animation: { phase in
                phase.anim
            }
            .onTapGesture {
                self.startAnimation.toggle()
            }
    }
}

#Preview {
    EmojiView()
}
