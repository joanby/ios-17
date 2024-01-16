//
//  ContentView.swift
//  F37-Velocidad
//
//  Created by Juan Gabriel Gomila Salas on 16/1/24.
//

import SwiftUI

struct SpeedometerView: View {
    
    @State private var progress = 124.0
    
    private let maxSpeed = 300.0
    
    private let style = SpeedometerGauge()
    
    var body: some View {
        Gauge(value: self.progress, in: 0 ... self.maxSpeed) {
            Image(systemName: "gauge.with.dots.needle.33percent")
                .font(.system(size:40.0))
        } currentValueLabel: {
            HStack{
                //Image(systemName: "gauge.medium")
                Text("\(self.progress.formatted(.number))")
            }
        } minimumValueLabel: {
            Text(0.formatted(.number))
        } maximumValueLabel: {
            Text(self.maxSpeed.formatted(.number))
        }
        .gaugeStyle(self.style) //Estilo personalizado
        .tint(.teal)
        .padding()

    }
}

#Preview {
    SpeedometerView()
}
