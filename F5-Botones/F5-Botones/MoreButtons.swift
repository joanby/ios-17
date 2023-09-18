//
//  MoreButtons.swift
//  F5-Botones
//
//  Created by Juan Gabriel Gomila Salas on 18/9/23.
//

import SwiftUI

struct MoreButtons: View {
    var body: some View {
        VStack {
            Button{
                
            } label: {
                Text("Añadir al Carrito")
            }

            
            Button{
                
            } label: {
                Text("Buscar más cursos")
            }
            
            
            Button{
                
            } label: {
                Text("Pagar")
            }
            
            Button("Eliminar", role: .destructive){
                print("Eliminar pulsado")
            }
            
            Button("Cancelar", role: .cancel){
                print("Cancelar pulsado")
            }
            
        }
        
        //.tint(.green)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 8))
        //.buttonBorderShape(.automatic)
        .controlSize(.extraLarge)
         
    }
}

#Preview {
    MoreButtons()
}
