//
//  SpeedometerGauge.swift
//  F37-Velocidad
//
//  Created by Juan Gabriel Gomila Salas on 16/1/24.
//

import SwiftUI

struct SpeedometerGauge : GaugeStyle {
    
    private var gradient = LinearGradient(gradient:
                                            Gradient(colors: [
                                                Color(red: 182/255, green: 150/255, blue: 206/255),
                                                Color(red: 89/255, green: 140/255, blue: 160/255)]
                                                    ),
                                          startPoint: .leading, endPoint: .trailing)
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            
            Circle()
                .foregroundStyle(Color.teal.opacity(0.2))
            
            Circle()
                .trim(from: 0, to: 0.75*configuration.value)
                .stroke(self.gradient, lineWidth: 25)
                .rotationEffect(.degrees(135))
            
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 12, lineCap: .butt,
                                                        lineJoin: .round, dash: [1, 30],
                                                        dashPhase: 0))
                .rotationEffect(.degrees(135))
            
            VStack{
                configuration.currentValueLabel
                    .font(.system(size: 90, weight: .bold, design: .rounded))
                    .foregroundStyle(.teal)
                
                Text("KM/H")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundStyle(.teal)
            }
            
        }
        .frame(width: 350, height: 350)
    }
    
}
