//
//  Hueco.swift
//  F38-Cuadricula
//
//  Created by Juan Gabriel Gomila Salas on 19/1/24.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        Grid(alignment: .bottom, horizontalSpacing: 0, verticalSpacing: 0) {
            GridRow{
                ImageCellView(imageName: "bolt.fill")
                ImageCellView(imageName: "bolt.fill")
                ImageCellView(imageName: "bolt.fill")
            }
            .padding(.bottom, 24)
            
            GridRow{
                ImageCellView(imageName: "bolt.fill")
                Color.black
                    .frame(width: 50, height: 50)
                    .gridCellAnchor(.topTrailing)
                    //.gridCellUnsizedAxes([.horizontal, .vertical])
                ImageCellView(imageName: "bolt.fill")
            }
            GridRow{
                ImageCellView(imageName: "bolt.fill")
                ImageCellView(imageName: "bolt.fill")
                ImageCellView(imageName: "bolt.fill")
            }
        }
    }
}

#Preview {
    BlankView()
}



struct ImageCellView: View {
    
    var imageName: String = "camera"
    
    var body: some View {
        Image(systemName: self.imageName)
            .frame(width: 100, height: 100)
            .background(in: Rectangle())
            .backgroundStyle(.teal)
            .foregroundStyle(.white.shadow(.drop(radius: 2, y: 4.0)))
            .font(.system(size: 60))
    }
}
