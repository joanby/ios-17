//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Juan Gabriel Gomila Salas on 20/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 250, height: 250)
                .foregroundStyle(circleColorChanged ? Color(.systemGray6) : .teal)
            
            Image(systemName: "heart.fill")
                .font(.system(size: 80))
                .foregroundStyle(heartColorChanged ? .teal : Color(.systemGray6))
                .scaleEffect(heartSizeChanged ? 1.5 : 0.75)
                
            
        }
        //ANIMACIONES IMPLÍCITAS
        //.animation(.default, value: circleColorChanged)
        //.animation(.spring(.bouncy, blendDuration: 1.0), value: heartSizeChanged)
        .onTapGesture {
            //ANIMACIONES EXPLÍCITAS
            withAnimation(.spring(.bouncy, blendDuration: 1.0)){
                circleColorChanged.toggle()
                heartSizeChanged.toggle()
            }
            //CAMBIO SIN ANIMACIÓN
            heartColorChanged.toggle()
        }
    }
}

#Preview {
    ContentView()
}
