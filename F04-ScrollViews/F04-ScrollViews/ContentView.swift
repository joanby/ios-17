//
//  ContentView.swift
//  F04-ScrollViews
//
//  Created by Juan Gabriel Gomila Salas on 15/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading){
                    Text("15 de Septiembre de 2023")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Text("Tus cursos")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                }
                
                Spacer()
            }.padding([.top, .horizontal])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    Group{
                        CardView(image: "swift5",
                                 title: "Curso de Swift 5",
                                 description: "Aprende el lenguaje de programación de Apple desde cero",
                                 level: "Nivel Fácil")
                        
                        CardView(image: "ios10",
                                 title: "Curso de iOS 10",
                                 description: "Crea tus primeras apps con iOS 10 y Swift",
                                 level: "Nivel Medio")
                        
                        CardView(image: "ios11",
                                 title: "Curso de iOS 11",
                                 description: "Crea tus primeras apps con iOS 11 y Swift",
                                 level: "Nivel Medio")
                        
                        CardView(image: "ios12",
                                 title: "Curso de iOS 12",
                                 description: "Crea tus primeras apps con iOS 12 y Swift",
                                 level: "Nivel Medio")
                        
                        CardView(image: "ios13",
                                 title: "Curso de Swift UI e iOS 13",
                                 description: "Crea tus primeras apps con iOS 13 y Swift UI",
                                 level: "Nivel Fácil")
                        
                    }.frame(width: 320, height: 400)
                }
            }
        }
    }
}


struct ContentViewVertical: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                
                
                HStack {
                    VStack(alignment: .leading){
                        Text("15 de Septiembre de 2023")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        Text("Tus cursos")
                            .font(.system(.largeTitle, design: .rounded))
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                }.padding([.top, .horizontal])
                
                CardView(image: "swift5",
                         title: "Curso de Swift 5",
                         description: "Aprende el lenguaje de programación de Apple desde cero",
                         level: "Nivel Fácil")
                CardView(image: "ios10",
                         title: "Curso de iOS 10",
                         description: "Crea tus primeras apps con iOS 10 y Swift",
                         level: "Nivel Medio")
                CardView(image: "ios11",
                         title: "Curso de iOS 11",
                         description: "Crea tus primeras apps con iOS 11 y Swift",
                         level: "Nivel Medio")
                CardView(image: "ios12",
                         title: "Curso de iOS 12",
                         description: "Crea tus primeras apps con iOS 12 y Swift",
                         level: "Nivel Medio")
                CardView(image: "ios13",
                         title: "Curso de Swift UI e iOS 13",
                         description: "Crea tus primeras apps con iOS 13 y Swift UI",
                         level: "Nivel Fácil")
            }
        }
    }
}

#Preview {
    ContentView()
}
