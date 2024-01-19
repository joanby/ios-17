//
//  ContentView.swift
//  F38-Cuadricula
//
//  Created by Juan Gabriel Gomila Salas on 18/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid{
            GridRow{
                Color.red
                Color.green
                Color.purple
            }
            
            GridRow{
                Color.yellow
                Color.blue
                Color.teal
            }
            
            GridRow{
                Color.brown
                Color.orange
                Color.mint
            }
        }
    }
}

#Preview {
    ContentView()
}
