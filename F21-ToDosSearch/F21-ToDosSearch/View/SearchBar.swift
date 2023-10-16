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


struct SearchBar : View {
    
    @Binding var text: String
    
    private var searchText: Binding<String> {
        Binding<String>(
            get: {
                self.text.uppercased()
            },
            set: {
                self.text = $0
            }
        )
    }
    
    @State private var isEditing : Bool = false
    
    var body: some View {
        HStack{
            TextField("Buscar una tarea...", text: self.searchText)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if self.isEditing {
                            Button(action: {
                                self.text = ""
                            }, label: {
                                Image(systemName: "x.circle.fill")
                                    .foregroundStyle(.gray)
                                    .padding(.trailing, 8)
                            })
                        }
                    }
                )
                .padding(.horizontal, 16)
                .onTapGesture {
                    withAnimation {
                        self.isEditing = true
                    }
                }
            
            if self.isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancelar")
                        .foregroundStyle(.teal)
                })
                .padding(.trailing, 12)
                .transition(.move(edge: .trailing))
            }
        }
    }
    
}
