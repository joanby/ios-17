//
//  Arcos.swift
//  F07-Figuras
//
//  Created by Juan Gabriel Gomila Salas on 19/9/23.
//

import SwiftUI

struct Arcos: View {
    var body: some View {
        ZStack {
            Path{ path in
                path.move(to: CGPoint(x: 180, y: 180))
                path.addArc(center: .init(x: 180, y: 180), radius: 150, startAngle: .degrees(360), endAngle: .degrees(200), clockwise: true)
            }
            .fill(.cyan)
            
            Path{ path in
                path.move(to: CGPoint(x: 180, y: 180))
                path.addArc(center: .init(x: 180, y: 180), radius: 150, startAngle: .degrees(200), endAngle: .degrees(120), clockwise: true)
            }
            .fill(.yellow)
            
            Path{ path in
                path.move(to: CGPoint(x: 180, y: 180))
                path.addArc(center: .init(x: 180, y: 180), radius: 150, startAngle: .degrees(120), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.red)
            .offset(x:-8, y:30)
            
            ZStack {
                Path{ path in
                    path.move(to: CGPoint(x: 180, y: 180))
                    path.addArc(center: .init(x: 180, y: 180), radius: 150, startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
                    path.closeSubpath()
                }
                .fill(.purple)
                .overlay(
                    Text("25%")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 60, y: -140)
                )
                
                Path{ path in
                    path.move(to: CGPoint(x: 180, y: 180))
                    path.addArc(center: .init(x: 180, y: 180), radius: 150, startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
                    path.closeSubpath()
                }
                .stroke(.black, lineWidth: 4)
            }
        }
    }
}

#Preview {
    Arcos()
}
