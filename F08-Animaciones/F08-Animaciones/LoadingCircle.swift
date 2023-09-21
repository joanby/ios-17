//
//  LoadingCircle.swift
//  F08-Animaciones
//
//  Created by Juan Gabriel Gomila Salas on 20/9/23.
//

import SwiftUI

struct LoadingCircle: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            
            Text("Cargando")
                .font(.system(.body, design: .rounded))
                .bold()
            
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 150, height: 150)
            
            Circle()
                .trim(from:0, to:0.3)
                .stroke(.teal, lineWidth: 8)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isLoading)
                .onAppear(){
                    isLoading = true
            }
        }
    }
}

#Preview {
    LoadingCircle()
}
