//
//  ContentView.swift
//  F02-Imagenes
//
//  Created by Juan Gabriel Gomila Salas on 13/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //EJEMPLO CON SFSYMBOLS
        Image(systemName: "externaldrive.fill.badge.wifi", variableValue: 0.6)
            .symbolRenderingMode(.palette)
            .font(.system(size: 80))
            .foregroundStyle(.cyan, .yellow, .green)
            .shadow(color: .gray, radius: 15, x:0, y:10)
       /* Image("juangabriel")
            .resizable()
            .ignoresSafeArea(.container, edges: .all)
            //.scaledToFit()
            //.scaledToFill()
            .aspectRatio(contentMode: .fill)
            .frame(width: 400.0, height: 400)
            .clipped()
            //.clipShape(Circle())
            //.opacity(0.5)
            .overlay(
                //SÍMBOLO
                /*Image(systemName:"hand.thumbsup.fill")
                    .font(.system(size:80))
                    .foregroundColor(.blue)
                    .opacity(0.5)*/
                
                //TEXTO
                /*Text("Juan Gabriel en la boda de su tía.")
                    .fontWeight(.black)
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.blue)
                    .opacity(0.7)
                    .cornerRadius(25),
                alignment: .bottom*/
                
                Color.black
                    .opacity(0.3)
                    .overlay(
                    Text("Juan Gabriel de boda")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 200)
                    )
                
            )*/
    }
}

#Preview {
    ContentView()
}
