//
//  ContentView.swift
//  F06-Estados
//
//  Created by Juan Gabriel Gomila Salas on 18/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying = false
    
    var body: some View {
       
        Button{
            //Cambiar el play a stop según los estados de la app
            isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "stop.circle": "play.circle")
                .font(.system(size: 80))
                .foregroundColor(isPlaying ? .red : .cyan)
        }
        
    }
}

#Preview {
    ContentView()
}
