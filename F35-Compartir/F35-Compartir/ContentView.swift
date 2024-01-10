//
//  ContentView.swift
//  F35-Compartir
//
//  Created by Juan Gabriel Gomila Salas on 9/1/24.
//

import SwiftUI

struct ContentView: View {
    
    private let url = URL(string: "https://cursos.frogamesformacion.com/pages/blog")!
    
    private let photo = Photo(image: Image("juangabriel"), title: "Juan Gabriel", description: "Foto de Juan Gabriel en su estudio")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            self.photo.image
                .resizable()
                .scaledToFit()
            //item: Transferable
            ShareLink(item: self.photo,
                      preview: SharePreview("Mira la nueva foto de Juan Gabriel", image: self.photo.image))
            
            
            
            ShareLink(item: url,
                      subject: Text("¡Comprueba este link!"),
                      message: Text("¡Si quieres aprender a programar, debes ver esta web!")) {
                Label("Toca para compartir", systemImage: "square.and.arrow.up.circle.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(.teal)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
