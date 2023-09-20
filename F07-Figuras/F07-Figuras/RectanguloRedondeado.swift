//
//  RectanguloRedondeado.swift
//  F07-Figuras
//
//  Created by Juan Gabriel Gomila Salas on 19/9/23.
//

import SwiftUI

struct RectanguloRedondeado: View {
    var body: some View {
        
        VStack {
            Button(action: {
            //TODO: implementar acción del botón
            }) {
                Text("Prueba")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 300, height: 100)
                    .background(RectangleOvalShape().fill(Color.teal))
            }
            
            Circle()
                .foregroundColor(.red)
                .frame(width: 300, height: 300)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundColor(.white)
                )
            
        }
        
    }
}

struct RectangleOvalShape: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x:0, y:0) )
        path.addQuadCurve(to: CGPoint(x:rect.size.width, y:0), control: CGPoint(x: rect.size.width/2, y: -0.15*rect.size.width))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        return path
    }
}

#Preview {
    RectanguloRedondeado()
}
