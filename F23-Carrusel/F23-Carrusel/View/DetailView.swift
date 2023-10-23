//
//  DetailView.swift
//  F23-Carrusel
//
//  Created by Juan Gabriel Gomila Salas on 19/10/23.
//

import SwiftUI

struct DetailView: View {
    
    let title: String
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                ZStack{
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text(self.title)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                        HStack(spacing: 8){
                            ForEach(1...5, id: \.self){ _ in
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.teal)
                                    .font(.system(size: 20))
                            }
                            
                            Text("5.0")
                                .font(.system(.headline))
                                .foregroundStyle(.teal)
                                .padding(.leading, 16)
                        }.padding(.bottom, 24)
                        
                        Text("Descripción del curso")
                            .font(.system(.headline))
                            .fontWeight(.bold)
                        
                        Text("""
Crear apps para iOS utilizando Swift y SpriteKit se ha convertido en uno de los trabajos mejor pagados, además de poder teletrabajar desde cualquier lugar. Nuestra ruta de ayudará a arrancar desde cero hasta terminar publicando más de 50 apps en el camino.\n\nEspecialización en iOS. Céntrate en solo en tu pasión. Tienes disponible todos los cursos sobre iOS.\n\nSuscripción más económica para todos los que tienen claro que solo quieren centrarse en iOS.\n\nUn año de formación. Hemos estimado que para completar la ruta completa se necesitan dedicarle 20 horas a la semana durante 52 semanas.\n\nAprende de lo más básico a lo más avanzado de iOS. Nuestra ruta esta creada para que puedas profundizar en los cursos de iOS.
""")
                        .padding(.bottom, 24)
                        
                        Button(action: {
                            //TODO: llevaría a la web del curso
                        }, label: {
                            Text("Apuntarme ahora al curso")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                                .padding(16)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color.teal)
                                .cornerRadius(16)
                            
                        })
                    })
                    .padding(16)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                    .background(.white)
                    .cornerRadius(16)
                    
                    Image(systemName: "bookmark.fill")
                        .font(.system(size:40))
                        .foregroundStyle(.teal)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                        .offset(x: -20, y: -5)
                }.offset(y:25)
            }
        }
    }
}

#Preview {
    DetailView(title: "Curso de Desarrollo de Apps para iOS 10")
        .background(.black)
}
