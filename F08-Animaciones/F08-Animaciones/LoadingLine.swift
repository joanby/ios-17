//
//  LoadingLine.swift
//  F08-Animaciones
//
//  Created by Juan Gabriel Gomila Salas on 20/9/23.
//

import SwiftUI

struct LoadingLine: View {
    
    @State private var isLoading = false
    
    var body: some View {
        
        ZStack{
            
            Text("Cargando")
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundColor(.teal)
                .offset(x:0, y:-30)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(.systemGray4), lineWidth: 5)
                .frame(width: 300, height: 5)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(.teal, lineWidth: 5)
                .frame(width: 30, height: 5)
                .offset(x: isLoading ? 135 : -135)
                .animation(.linear(duration: 2).repeatForever(autoreverses:true), value: isLoading)
            
            
        }.onAppear(){
            isLoading = true
        }
    }
}

#Preview {
    LoadingLine()
}
