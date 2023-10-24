//
//  LearningPathsView.swift
//  F25-Colecciones
//
//  Created by Juan Gabriel Gomila Salas on 23/10/23.
//

import SwiftUI

struct LearningPathsView: View {
    
    @State var layout = [GridItem(.adaptive(minimum: 300, maximum: 250)), GridItem(.flexible())]
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                LazyVGrid(columns: self.layout, alignment: .center, spacing: 16, content: {
                    
                    ForEach(paths){ path in
                        Image(path.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(maxHeight: 220)
                            .cornerRadius(16)
                            .shadow(color: .primary.opacity(0.4), radius: 6)
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70, maximum: 100))], content: {
                            
                            ForEach(path.photos){ photo in
                                Image(photo.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 60)
                                    .cornerRadius(16)
                            }
                            
                        })
                        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                        .animation(.easeInOut, value: self.layout.count)
                    }
                })
                .padding(.all, 16)
                .animation(.interactiveSpring(), value: self.layout.count)
            }
            .navigationTitle("Rutas de Frogames")
        }
        .onChange(of: verticalSizeClass){
            
            print("Hemos cambiado orientación")
            
            self.layout = [GridItem(.adaptive(minimum: verticalSizeClass == .regular ? 100 : 300)), GridItem(.flexible())]
            
        }
    }
}

#Preview {
    LearningPathsView()
}
