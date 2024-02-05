//
//  ContentView.swift
//  F48-AnimacionesKeyframe
//
//  Created by Juan Gabriel Gomila Salas on 3/2/24.
//

import SwiftUI


struct AnimationProperties {
    var scale = 1.0
    var verticalStretch = 1.0
    var translation = CGSize.zero
    var opacity = 1.0
}


struct ContentView: View {
    var body: some View {
        ZStack{
            Text("🐸")
                .font(.system(size: 100))
                .keyframeAnimator(initialValue: AnimationProperties()) { content, value in
                    content
                        .scaleEffect(value.scale)
                        .scaleEffect(y: value.verticalStretch)
                        .offset(value.translation)
                        .opacity(value.opacity)
                } keyframes: { _ in
                    KeyframeTrack(\.scale){
                        CubicKeyframe(0.8, duration: 0.2)
                        CubicKeyframe(0.5, duration: 0.3)
                        CubicKeyframe(1.0, duration: 0.4)
                        CubicKeyframe(0.8, duration: 0.6)
                        CubicKeyframe(0.5, duration: 0.6)
                        CubicKeyframe(1.0, duration: 0.7)
                    }
                    
                    KeyframeTrack(\.verticalStretch){
                        LinearKeyframe(1.5, duration: 0.3)
                        SpringKeyframe(2.5, duration: 0.5, spring: .snappy)
                        CubicKeyframe(1.5, duration: 0.2)
                        CubicKeyframe(1.7, duration: 0.3)
                        CubicKeyframe(1.2, duration: 0.1)
                        CubicKeyframe(1.3, duration: 0.25)
                        CubicKeyframe(1.0, duration: 0.4)
                    }
                    
                    KeyframeTrack(\.translation){
                        SpringKeyframe(CGSize(width: 120, height: 120), duration: 0.5)
                        SpringKeyframe(CGSize(width: -120, height: -250), duration: 0.4)
                        SpringKeyframe(CGSize(width: 60, height: -40), duration: 0.3)
                        SpringKeyframe(CGSize(width: -90, height: 400), duration: 0.5)
                        SpringKeyframe(.zero, duration: 0.5)
                    }
                    
                    KeyframeTrack(\.opacity){
                        LinearKeyframe(0.5, duration: 0.2)
                        LinearKeyframe(1.0, duration: 0.3)
                        LinearKeyframe(0.8, duration: 0.4)
                        LinearKeyframe(1.0, duration: 0.5)
                        LinearKeyframe(0.2, duration: 0.3)
                        LinearKeyframe(1.0, duration: 0.2)
                    }
                    
                }
            
            
            Text("🙈")
                .font(.system(size: 100))
                .keyframeAnimator(initialValue: AnimationProperties()) { content, value in
                    content
                        .scaleEffect(value.scale)
                        .scaleEffect(y: value.verticalStretch)
                        .offset(value.translation)
                        .opacity(value.opacity)
                } keyframes: { _ in
                    KeyframeTrack(\.scale){
                        CubicKeyframe(0.8, duration: 0.5)
                        CubicKeyframe(0.5, duration: 0.3)
                        CubicKeyframe(1.0, duration: 0.4)
                        CubicKeyframe(0.8, duration: 0.6)
                        CubicKeyframe(0.5, duration: 0.6)
                        CubicKeyframe(1.0, duration: 0.7)
                    }
                    
                    KeyframeTrack(\.verticalStretch){
                        LinearKeyframe(1.5, duration: 0.4)
                        SpringKeyframe(2.5, duration: 0.5, spring: .snappy)
                        CubicKeyframe(1.5, duration: 0.2)
                        CubicKeyframe(1.7, duration: 0.3)
                        CubicKeyframe(1.2, duration: 0.1)
                        CubicKeyframe(1.3, duration: 0.25)
                        CubicKeyframe(1.0, duration: 0.4)
                    }
                    
                    KeyframeTrack(\.translation){
                        SpringKeyframe(CGSize(width: 40, height: 78), duration: 0.1)
                        SpringKeyframe(CGSize(width: -23, height: -80), duration: 0.4)
                        SpringKeyframe(CGSize(width: 47, height: -40), duration: 0.3)
                        SpringKeyframe(CGSize(width: -90, height: 400), duration: 0.5)
                        SpringKeyframe(.zero, duration: 0.5)
                    }
                    
                    KeyframeTrack(\.opacity){
                        LinearKeyframe(0.5, duration: 0.2)
                        LinearKeyframe(1.0, duration: 0.2)
                        LinearKeyframe(0.8, duration: 0.4)
                        LinearKeyframe(1.0, duration: 0.1)
                        LinearKeyframe(0.2, duration: 0.2)
                        LinearKeyframe(1.0, duration: 0.2)
                    }
                    
                }
        }

    }
}

#Preview {
    ContentView()
}
