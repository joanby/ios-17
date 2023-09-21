//
//  PurchaseButton.swift
//  F08-Animaciones
//
//  Created by Juan Gabriel Gomila Salas on 20/9/23.
//

import SwiftUI

struct PurchaseButton: View {
    
    @State private var processing = false
    @State private var completed = false
    @State private var loading = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40)
                .frame(width: processing ? 300 : 200, height: 80)
                .foregroundStyle(completed ? .green : .indigo)
            
            if(!processing){
                Text("Comprar")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .transition(.move(edge: .top))
            }
            
            if(processing && !completed){
                HStack{
                    Circle()
                        .trim(from: 0, to: 0.8)
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width:40, height:40)
                        .rotationEffect(.degrees(loading ? 360 : 0))
                        .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: loading)
                    
                    Text("Procesando")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                }
                .onAppear(){
                    startProcessing()
                }
            }
            
            if completed {
                Text("Completado")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .onAppear(){
                        endProcessing()
                    }
            }
            
        }
        .animation(.spring(), value: loading)
        .onTapGesture {
            if !loading{
                processing.toggle()
            }
        }
    }
    
    
    
    private func startProcessing(){
        self.loading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.completed = true
        }
    }
    
    private func endProcessing(){
        DispatchQueue.main.asyncAfter(deadline: .now()+5)
        {
            self.processing = false
            self.completed = false
            self.loading = false
        }
    }
    
    
}

#Preview {
    PurchaseButton()
}
