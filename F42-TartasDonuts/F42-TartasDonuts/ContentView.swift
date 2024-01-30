//
//  ContentView.swift
//  F42-TartasDonuts
//
//  Created by Juan Gabriel Gomila Salas on 26/1/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    private var sales = [
        (name: "iOS 17",        count: 321),
        (name: "Estadística",   count: 456),
        (name: "Kotlin",        count: 126),
        (name: "Unity",         count: 548),
        (name: "Power BI",      count: 428),
        (name: "Excel",         count: 321),
        (name: "Swift 5",       count: 78)
    ]
    
    @State private var selectedCount: Int?
    @State private var selectedSector: String?
    
    
    var body: some View {
        VStack {
            Chart{
                ForEach(self.sales, id: \.name){ course in
                    SectorMark(
                        angle: .value("Ventas", course.count),
                        innerRadius: .ratio(0.6),
                        //outerRadius: course.name == "Unity" ? 160 : 140,
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Nombre", course.name))
                    .cornerRadius(5.0)
                    .opacity(self.selectedSector == nil ? 1.0 : (self.selectedSector == course.name ? 1.0 : 0.5))
                    .annotation(position: .overlay) {
                        Text("\(course.count)")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
            .frame(height: 400)
            .chartBackground { proxy in
                //Image(systemName: "book")
                Text("📚")
                    .font(.system(size: 80))
            }
            .chartAngleSelection(value: self.$selectedCount)
            .onChange(of: self.selectedCount) { oldValue, newValue in
                if let newValue {
                    self.selectedSector = self.findSector(value: newValue)
                } else {
                    self.selectedSector = nil
                }
            }
        }
        .padding()
    }
    
    
    private func findSector(value: Int) -> String? {
        var accumulated = 0
        
        let course = self.sales.first { (_, count) in
            accumulated += count
            return value <= accumulated
        }
        
        return course?.name
    }
}

#Preview {
    ContentView()
}
