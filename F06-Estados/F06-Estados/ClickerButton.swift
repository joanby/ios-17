//
//  ClickerButton.swift
//  F06-Estados
//
//  Created by Juan Gabriel Gomila Salas on 18/9/23.
//

import SwiftUI

struct ClickerButton: View {
    
    @State private var counterRed = 0
    @State private var counterYellow = 0
    @State private var counterGreen = 0
    @State private var counterBlue = 0
    
    var body: some View {
        VStack{
            Text("\(counterRed+counterYellow+counterGreen+counterBlue)")
                .font(.system(size: 120, weight: .bold, design: .rounded))
            
            HStack{
                RoundedButton(cnt: $counterRed, color: .red)
                RoundedButton(cnt: $counterYellow, color: .yellow)
            }
            HStack{
                RoundedButton(cnt: $counterGreen, color: .green)
                RoundedButton(cnt: $counterBlue, color: .blue)
            }
        }
    }
}


struct RoundedButton: View{
    
    @Binding var cnt: Int
    
    var color: Color
    
    var body: some View {
        Button {
            cnt += 1
        } label:{
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(color)
                .overlay(
                    Text("\(cnt)")
                        .foregroundColor(.white)
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                )
        }
    }
}

#Preview {
    ClickerButton()
}
