//
//  ContentView.swift
//  F44-Redondeos
//
//  Created by Juan Gabriel Gomila Salas on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animated = false
    
    var body: some View {
        VStack {
            //Botón
            Button(action: {
                withAnimation {
                    self.animated.toggle()
                }
            }) {
                Text("Empezar")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .tint(.white)
            .frame(width: 300, height: 100)
            .background {
                UnevenRoundedRectangle(cornerRadii:
                        .init(topLeading: self.animated ? 90.0 : 10.0,
                              bottomLeading: self.animated ? 10.0 : 90.0,
                              bottomTrailing: self.animated ? 10.0 : 90.0,
                              topTrailing: self.animated ? 90.0 : 10.0),
                                       style: .continuous)
                .frame(width: 300, height: 100)
                .foregroundStyle(.teal)
            }
            
            Spacer()
            
            //Insignia
            ZStack{
                ForEach(0..<18, id: \.self) { idx in
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 16.0, bottomLeading: 8.0, bottomTrailing: 16.0, topTrailing: 8.0),
                                           style: .continuous)
                    .foregroundStyle(.teal)
                    .frame(width: 300, height: 25)
                    .opacity(self.animated ? 0.4 : 1.0)
                    .rotationEffect(.degrees(Double(10*idx)))
                    .animation(.easeInOut.delay(Double(idx) * 0.03),
                               value: self.animated)
                }
            }
            .overlay {
                Image(systemName: "graduationcap.fill")
                    .foregroundStyle(.white)
                    .font(.system(size: 120))
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
