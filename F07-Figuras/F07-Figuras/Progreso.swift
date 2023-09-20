//
//  Completacion.swift
//  F07-Figuras
//
//  Created by Juan Gabriel Gomila Salas on 19/9/23.
//

import SwiftUI

struct Progreso: View {
    
    private var colorGradient = LinearGradient(gradient: Gradient(colors: [Color(red:180/255, green:150/255, blue:210/255), Color(red:100/255, green:110/255, blue:180/255)]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 15)
                .frame(width: 250, height: 250)
            
            Circle()
                .trim(from:0.0, to: 0.77)
                .stroke(colorGradient, lineWidth: 15)
                .frame(width: 250, height: 250)
                .rotationEffect(Angle(degrees: 90))
                .overlay(
                    VStack{
                        Text("77%")
                            .font(.system(size:60, weight: .black, design: .rounded))
                            .foregroundColor(Color(.systemIndigo))
                        Text("Completado")
                            .font(.system(.title3, design: .rounded))
                            .bold()
                            .foregroundColor(Color(.systemIndigo))
                    }
                )
        }
    }
}

#Preview {
    Progreso()
}
