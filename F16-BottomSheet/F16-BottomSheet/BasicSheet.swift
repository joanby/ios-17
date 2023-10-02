//
//  BasicSheet.swift
//  F16-BottomSheet
//
//  Created by Juan Gabriel Gomila Salas on 2/10/23.
//

import SwiftUI

struct BasicSheet: View {
    
    @State private var showSheet = false
    
    var body: some View {
        Button("Mostrar Bottom Sheet"){
            self.showSheet.toggle()
        }
        .buttonStyle(.bordered)
        .sheet(isPresented: self.$showSheet, content: {
            Text("Esto es un texto en la expandable bottom sheet.")
                .presentationDetents([.medium, .large])
        })
        
        Spacer()
    }
}

#Preview {
    BasicSheet()
}
