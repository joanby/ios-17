//
//  ContentView.swift
//  F39-Orientaciones
//
//  Created by Juan Gabriel Gomila Salas on 24/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
        
    var body: some View {
        
        let layout = (self.horizontalSizeClass == .regular) ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        
        layout {
           ImageCell(imageName: "desktopcomputer",
                     backgroundColor: .teal)
        
            ImageCell(imageName: "laptopcomputer",
                      backgroundColor: .purple)
            
            ImageCell(imageName: "ipad",
                      backgroundColor: .yellow)
            
            ImageCell(imageName: "iphone",
                      backgroundColor: .indigo)
        }
        .padding()
    }
}


struct ImageCell: View {
    
    var imageName = ""
    var backgroundColor = Color.teal
    
    var body: some View {
        Image(systemName: self.imageName)
             .font(.system(size: 70))
             .frame(width: 150, height: 150)
             .background(in: RoundedRectangle(cornerRadius: 8))
             .backgroundStyle(self.backgroundColor)
             .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}


struct MyLayout : Layout{
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        <#code#>
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        <#code#>
    }
}
