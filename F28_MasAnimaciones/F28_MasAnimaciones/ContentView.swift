//
//  ContentView.swift
//  F28_MasAnimaciones
//
//  Created by Juan Gabriel Gomila Salas on 8/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var expanded = false
    
    @Namespace private var circleTransition
    
    var body: some View {
        
        if self.expanded {
            //Caso Final
            
            RoundedRectangle(cornerRadius: 75)
                .fill(.teal)
                .matchedGeometryEffect(id: "circle", in: self.circleTransition)
                .padding()
                .frame(width: 150, height: 150)
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.expanded.toggle()
                    }
                }
            Spacer()
            
        } else {
            Spacer()
            //Caso Inicial
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.purple)
                .matchedGeometryEffect(id: "circle", in: self.circleTransition)
                .padding(32)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 250)
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.expanded.toggle()
                    }
                }
            
           
        }
        
    }
}

#Preview {
    ContentView()
}


struct CircleToBackgroundView: View {
    
    @Namespace private var backgroundTransition
    
    @State private var expanded = false
    
    var body: some View {
        if self.expanded{
            //Fondo de pantalla
            RoundedRectangle(cornerRadius: 20.0)
                .matchedGeometryEffect(id: "shape", in: self.backgroundTransition)
                .foregroundStyle(.purple)
                .ignoresSafeArea()
                
                .onTapGesture {
                    withAnimation {
                        self.expanded.toggle()
                    }
                }
        } else{
            //Circulo
            Spacer()
            
            RoundedRectangle(cornerRadius: 50)
                .matchedGeometryEffect(id: "shape", in: self.backgroundTransition)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .foregroundStyle(.teal)
                
                .onTapGesture {
                    withAnimation {
                        self.expanded.toggle()
                    }
                }
        }
    }
}

#Preview("Circle To Background View"){
    CircleToBackgroundView()
}
