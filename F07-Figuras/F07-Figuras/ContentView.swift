//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Juan Gabriel Gomila Salas on 18/9/23.
//

import SwiftUI

struct ContentView: View {
    
    var start = CGPoint(x:300,y:200)
    var control = CGPoint(x:200,y:120)
    var end = CGPoint(x:100,y:200)
    
    var drawTriangle = false

    var body: some View {
        
        ZStack {
            Path(){ path in
                path.move(to: CGPoint(x:50, y:50))
                path.addLine(to: CGPoint(x:350, y: 50))
                path.addLine(to: CGPoint(x: 350, y: 220))
                path.addLine(to: start)
                path.addQuadCurve(to: end, control: control)
                if(drawTriangle){
                    path.addLine(to: start)
                    path.addLine(to: control)
                    path.addLine(to: end)
                }
                path.addLine(to: CGPoint(x: 50, y: 220))
                path.closeSubpath()
            }
            .fill(.green)
            
            
            Path(){ path in
                path.move(to: CGPoint(x:50, y:50))
                path.addLine(to: CGPoint(x:350, y: 50))
                path.addLine(to: CGPoint(x: 350, y: 220))
                path.addLine(to: start)
                path.addQuadCurve(to: end, control: control)
                if(drawTriangle){
                    path.addLine(to: start)
                    path.addLine(to: control)
                    path.addLine(to: end)
                }
                path.addLine(to: CGPoint(x: 50, y: 220))
                path.closeSubpath()
            }
            .stroke(.cyan, lineWidth: 6)
           
        }
    }
}

#Preview {
    ContentView()
}
