//
//  ContentView.swift
//  F01-Textos
//
//  Created by Juan Gabriel Gomila Salas on 13/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("**Esto es un texto en negrita.** *Esto es un texto en cursiva o itálica.* Podemos añadir un [link a nuestra web](https://cursos.frogamesformacion.com)")
            //.fontWeight(.bold)
            //.font(.system(size: 25, design: .rounded))
            .font(.custom("Poppins", size: 20))
            .foregroundColor(.purple)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .truncationMode(.middle)
            .lineSpacing(12)
            .padding(24)
            //.rotationEffect(.degrees(30), anchor: UnitPoint(x: 0.25, y: 0.25))
            .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
            .shadow(color: .gray, radius: 2, x:0, y:30)
    }
}

#Preview {
    ContentView()
}
