//
//  ContentView.swift
//  F25-Colecciones
//
//  Created by Juan Gabriel Gomila Salas on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    
    private var elements = ["highlighter", "paperplane", "desktopcomputer", "headphones", "video", "mic", "printer", "tv", "hifispeaker", "opticaldiscdrive"]
    
    private var colors : [Color] = [
        .yellow, .teal, .purple
    ]
    
    private var layout = [
        GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 50, maximum: 200))
    ]
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: self.layout, spacing: 24){
                ForEach((0...999), id: \.self){
                    Image(systemName: self.elements[$0%self.elements.count])
                        .font(.system(size: 35))
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: .infinity)
                        .background(self.colors[$0%self.colors.count])
                        .cornerRadius(16)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
