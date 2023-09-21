//
//  MorphingView.swift
//  F08-Animaciones
//
//  Created by Juan Gabriel Gomila Salas on 20/9/23.
//

import SwiftUI

struct MorphingView: View {
    
    @State private var beginRecording = false
    @State private var isRecording = false
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: beginRecording ? 50 : 10)
                .frame(width: beginRecording ? 100 : 300, height: 100)
                .foregroundColor(beginRecording ? .red : .teal)
                .overlay(
                    Image(systemName: "mic")
                        .font(.system(.largeTitle))
                        .foregroundStyle(.white)
                        .scaleEffect(isRecording ? 0.75 : 1.0)
                )
            
            RoundedRectangle(cornerRadius: beginRecording ? 60 : 10)
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: beginRecording ? 0.000001: 1)
                .stroke(lineWidth: 6)
                .frame(width: beginRecording ? 120 : 320, height: 120)
                .foregroundStyle(.teal)
            
        }.onTapGesture {
            withAnimation(.default){
                beginRecording.toggle()
            }
            
            withAnimation(.linear(duration: 1).repeatForever().delay(0.5)){
                isRecording.toggle()
            }
        }
    }
}

#Preview {
    MorphingView()
}
