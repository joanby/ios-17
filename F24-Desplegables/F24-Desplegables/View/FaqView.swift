//
//  FaqView.swift
//  F24-Desplegables
//
//  Created by Juan Gabriel Gomila Salas on 23/10/23.
//

import SwiftUI

struct FaqView: View {
    
    @State var showContent = Array(repeating: false, count: 3)
    
    private let faqs = [
        (question: "1. ¿Qué incluye la suscripción anual de Frogames?", answer: "Nuestra suscripción anual contiene más de 150 cursos en línea organizados en rutas de programación, matemáticas, videojuegos, IA o desarrollo entre otras para iniciarte en cualquiera de nuestros campos. Los cursos están organizados por dificultad, contienen soporte de instructor, acceso mensual en vivo, acceso 24/7 durante todo el mes, y actualizaciones periódicas y nuevas versiones. Además, ahorras el valor de 3 meses de suscripción en comparación a la suscripción mensual."),
        
        (question: "2. ¿Las clases en qué formato son?", answer: "La clases están en vídeo. Con una duración de variable de entre 2 y 30 minutos, y con posibilidad de ver los vídeos las veces que necesites"),
        
        (question: "3. ¿Tendré certificado del curso?", answer: "Sí. Al terminar el curso obtendrás un certificado digital firmado único del curso avalado por Accredible con tecnología blockchain que certifica tu participación y aprovechamiento del curso."),
        
    ]
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(faqs.indices, id: \.self) { idx in
                    DisclosureGroup(
                        isExpanded: self.$showContent[idx],
                        content: {
                            Text(faqs[idx].answer)
                                .font(.body)
                                .fontWeight(.thin)
                        },
                        label: {
                                
                            Text(faqs[idx].question)
                                    .font(.headline)
                                    .bold()
                                    .foregroundStyle(.teal)
                            
                        }
                    ).padding()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Preguntas Frecuentes")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        self.showContent = self.showContent.map({ _ in
                            true
                        })
                        
                    }, label: {
                        Text("Ver todas")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.teal)
                    })
                }
            }
        }
    }
}

#Preview {
    FaqView()
}
