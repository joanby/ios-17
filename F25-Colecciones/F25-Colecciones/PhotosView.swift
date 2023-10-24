//
//  PhotosView.swift
//  F25-Colecciones
//
//  Created by Juan Gabriel Gomila Salas on 23/10/23.
//

import SwiftUI

struct PhotosView: View {
    
    @State var layout : [GridItem] = [GridItem()]
    
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical){
                LazyVGrid(columns: self.layout, alignment: .center, spacing: 16) {
                    ForEach(photos.indices, id: \.self){ idx in
                        Image(photos[idx].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: self.layout.count == 1 ? 220: 120)
                            .cornerRadius(16)
                            .shadow(color: Color.primary.opacity(0.4), radius: 4)
                    }
                    
                }
                .padding(.all, 16) 
                .animation(.interactiveSpring(), value: self.layout.count)
            }
            .navigationTitle("Cursos de Frogames")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        self.layout = Array(repeating: GridItem(.flexible()), count: self.layout.count%4+1)
                    } label: {
                        Image(systemName: "square.grid.2x2.fill")
                            .font(.title)
                    }
                    .tint(.teal)
                }
            }
        }
    }
}

#Preview {
    PhotosView()
}
