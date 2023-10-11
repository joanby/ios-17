//
//  Prueba.swift
//  F20-ToDos
//
//  Created by Juan Gabriel Gomila Salas on 10/10/23.
//

import SwiftUI


#Preview {
    SearchBar(text: .constant(""))
}


struct SearchBar : UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UISearchBar {
        //Configuramos la UIView desde el contexto
        let searchbar =  UISearchBar()
        
        searchbar.searchBarStyle = .minimal
        searchbar.autocapitalizationType = .none
        searchbar.placeholder = "Buscar una tarea..."
        
        return searchbar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        //Actualizar la vista en función del contexto
        uiView.text = self.text
    }
}
