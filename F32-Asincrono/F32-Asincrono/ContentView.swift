//
//  ContentView.swift
//  F32-Asincrono
//
//  Created by Juan Gabriel Gomila Salas on 8/1/24.
//

import SwiftUI

struct ContentView: View {
    
    let imageURL = "https://import.cdn.thinkific.com/630745%2Fcustom_site_themes%2Fid%2FGbgsVDDrT4uAGrrQShBC_juan-gabriel-gomila.jpg"
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: self.imageURL),
                       transaction: Transaction(animation: .spring(duration: 1.5))){ phase in
                
                switch phase {
                case .empty: //Actúa a modo de placeholder
                    Color.teal.opacity(0.3)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .transition(.slide)
                case .failure(_):
                    Image(systemName: "exclamationmark.icloud")
                        .resizable()
                        .scaledToFit()
                @unknown default:
                    Image(systemName: "xmark.icloud.fill")
                        .resizable()
                        .scaledToFit()
                }
                
            }/* placeholder: {
                Color.teal.opacity(0.3)
            }*/
            .frame(width: 320, height: 520)
            .cornerRadius(24)
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
