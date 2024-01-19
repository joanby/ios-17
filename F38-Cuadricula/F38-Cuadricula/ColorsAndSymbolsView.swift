//
//  ColorsAndSymbolsView.swift
//  F38-Cuadricula
//
//  Created by Juan Gabriel Gomila Salas on 18/1/24.
//

import SwiftUI

struct ColorsAndSymbolsView: View {
    var body: some View {
        Grid{
            GridRow {
                Image(systemName: "photo")
                    .font(.system(size: 120))
                
                Image(systemName: "camera")
                    .font(.system(size: 60))
                
            
            }
            
            GridRow{
                Color.teal
                    .overlay {
                        Image(systemName: "camera.aperture")
                            .font(.system(size: 150))
                            .foregroundStyle(.white)
                    }
                    .gridCellColumns(2)

            }
        }
    }
}

#Preview {
    ColorsAndSymbolsView()
}
