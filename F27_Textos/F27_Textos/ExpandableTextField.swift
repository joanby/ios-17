//
//  ExpandableTextField.swift
//  F27_Textos
//
//  Created by Juan Gabriel Gomila Salas on 8/11/23.
//

import SwiftUI

struct ExpandableTextField: View {
    @State private var text = ""
    
    var body: some View {
        TextField("Comentario", text: self.$text, prompt: Text("Introduce tu comentario"), axis: .vertical)
            .lineLimit(3...5)
            .padding(16)
            .background(Color.teal.opacity(0.25))
            .cornerRadius(8)
            .padding()
    }
}

#Preview {
    ExpandableTextField()
}
