//
//  ContentView.swift
//  F33-Charts
//
//  Created by Juan Gabriel Gomila Salas on 8/1/24.
//

import SwiftUI
import Charts

struct StepsCharts: View {
    
    let days = Calendar.current.shortWeekdaySymbols
    let steps = [10243, 7856, 8267, 9768, 3728, 5647, 9802]
    
    var body: some View {
        Chart{
            ForEach(self.days.indices, id: \.self ){ idx in
                BarMark(
                    x: .value("Pasos", self.steps[idx]),
                    y: .value("Día", self.days[idx])
                )
                .foregroundStyle(by: .value("Día", self.days[idx]))
                .annotation {
                    Text("\(self.steps[idx])")
                }
            }
        }
    }
}

#Preview {
    StepsCharts()
}
