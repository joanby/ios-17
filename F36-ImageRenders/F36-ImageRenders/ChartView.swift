//
//  ChartView.swift
//  F36-ImageRenders
//
//  Created by Juan Gabriel Gomila Salas on 10/1/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    let chartData = [(city: "Madrid", data: madData),
                     (city: "Barcelona", data: bcnData),
                     (city: "Palma de Mallorca", data: palData)]
    
  
    
    
    var body: some View {
        Chart{
            ForEach(chartData, id: \.city) { series in
                ForEach(series.data) { item in
                    LineMark(x: .value("Mes", item.date),
                             y: .value("Temperatura", item.temperature)
                    )
                    .interpolationMethod(.monotone)
                    
                }//Segmentación por ciudad
                .foregroundStyle(by: .value("Ciudad", series.city))
                .symbol(by: .value("Ciudad", series.city))
            }
        }
        .frame(width: 380, height: 550)
        .chartXAxis {
            AxisMarks(values: .stride(by: .month)){ value in
                AxisGridLine()
                AxisValueLabel(format: .dateTime.month(.defaultDigits))
            }
        }
        .chartYAxis{
            AxisMarks(position: .leading)
        }
        .chartPlotStyle { content in
            content
                .background(Color.teal.opacity(0.2))
        }
    }
}

#Preview {
    ChartView()
}
