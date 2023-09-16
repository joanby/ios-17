//
//  CardView.swift
//  F04-ScrollViews
//
//  Created by Juan Gabriel Gomila Salas on 15/9/23.
//

import SwiftUI

struct CardView: View {
    
    var image: String
    var title: String
    var description: String
    var level: String
    
    
    
    var body: some View {
        
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                        .minimumScaleFactor(0.3)
                    
                    Text(description)
                        .font(.title2)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    
                    Text(level)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.sRGB, red: 140/255, green: 140/255, blue: 140/255, opacity: 0.6),  lineWidth: 2)
        )
        .padding([.top, .horizontal])
        
    }
}

#Preview {
        CardView(image: "swift5", title: "Curso de Swift 5", description: "Aprende el lenguaje de Programación de Apple desde cero", level: "Nivel Fácil")
}
