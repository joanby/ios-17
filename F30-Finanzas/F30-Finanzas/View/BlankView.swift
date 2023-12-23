//
//  BlankView.swift
//  F30-Finanzas
//
//  Created by Juan Gabriel Gomila Salas on 11/12/23.
//

import SwiftUI

struct BlankView: View {
    
    var bgColor: Color
    var body: some View {
        VStack{
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(self.bgColor)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BlankView(bgColor: .teal)
}
