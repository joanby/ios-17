//
//  DonutChart.swift
//  F07-Figuras
//
//  Created by Juan Gabriel Gomila Salas on 19/9/23.
//

import SwiftUI

struct DonutChart: View {
    
    var linewidth = 90.0
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.3)
                .stroke(Color(.systemCyan), lineWidth: linewidth)
            
            Circle()
                .trim(from: 0.3, to: 0.55)
                .stroke(Color(.systemPurple), lineWidth: linewidth)
            
            Circle()
                .trim(from: 0.55, to: 0.75)
                .stroke(Color(.systemMint), lineWidth: linewidth)
            
            Circle()
                .trim(from: 0.75, to: 1.0)
                .stroke(Color(.systemPink), lineWidth: linewidth)
        }
        .frame(width: 280, height: 280)
    }
}

#Preview {
    DonutChart()
}
