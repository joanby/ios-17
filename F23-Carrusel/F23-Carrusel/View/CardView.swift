//
//  CardView.swift
//  F23-Carrusel
//
//  Created by Juan Gabriel Gomila Salas on 19/10/23.
//

import SwiftUI

struct CardView: View {
    
    let title: String
    let imageName: String
    
    @Binding var showDetails: Bool
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Image(self.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(self.showDetails ? 0 : 16)
                    .overlay(
                        Text(self.title)
                            .foregroundStyle(Color.white)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.black)
                            .padding(16)
                            .background(Color.teal)
                            .padding([.bottom, .leading])
                            .opacity(self.showDetails ? 0 : 1 )
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    )
                
            }
        }
    }
}

#Preview("Vista de Tarjeta") {
    CardView(title: "Curso de iOS 10", imageName: "ios10", showDetails: .constant(false))
}

#Preview("Vista de Pantalla Completa") {
    CardView(title: "Curso de iOS 10", imageName: "ios10", showDetails: .constant(true))
}
