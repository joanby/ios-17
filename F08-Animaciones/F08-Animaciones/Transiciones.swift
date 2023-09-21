//
//  Transiciones.swift
//  F08-Animaciones
//
//  Created by Juan Gabriel Gomila Salas on 20/9/23.
//

import SwiftUI

struct Transiciones: View {
    
    @State private var showDetails = false
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 250, height: 250)
                .foregroundStyle(.teal)
                .overlay(
                    Text("Ver detalles")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                )
            
            if showDetails {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 250, height: 250)
                    .foregroundStyle(.green)
                    .overlay(
                        Text("Estás viendo la vista del detalle")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                    )
                    .transition(.scaleInOffsetOut)
            }
        }.onTapGesture {
            withAnimation(.default){
                showDetails.toggle()
            }
        }
    }
}


extension AnyTransition {
    static var offsetScaledOpacity: AnyTransition {
        AnyTransition
            .offset(x:600, y:0)
            .combined(with: .scale(scale: 0, anchor: .top))
            .combined(with: .opacity)
    }
    
    static var scaleInOffsetOut: AnyTransition{
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .top), removal: .offset(x:400, y:0))
    }
}

#Preview {
    Transiciones()
}
