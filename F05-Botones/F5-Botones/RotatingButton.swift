//
//  RotatingButton.swift
//  F5-Botones
//
//  Created by Juan Gabriel Gomila Salas on 18/9/23.
//

import SwiftUI

struct RotatingButton: View {
    var body: some View {
        Button{
            print("Botón + pulsado.")
        } label: {
            Image(systemName: "plus")
        }
        .buttonStyle(RotatingStyle())
    }
}

struct RotatingStyle: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .rotationEffect(configuration.isPressed ? Angle(degrees:45) : Angle(degrees: 0))
    }
}

#Preview {
    RotatingButton()
}
