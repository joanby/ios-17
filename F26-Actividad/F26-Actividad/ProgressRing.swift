//
//  ProgressRing.swift
//  F26-Actividad
//
//  Created by Juan Gabriel Gomila Salas on 2/11/23.
//

import SwiftUI

struct ProgressRing: View {
    
    var thickness: CGFloat = 25.0
    var width: CGFloat = 220.0
    var color: Color = Color.darkBlue
    var gradient = Gradient(colors: [.darkBlue, .lightBlue])
    
    let startAngle = -90.0
    let circleThreshold = 0.95
    
    @Binding var progress: Double
    
    
    private var radius: Double {
        Double(width/2.0)
    }
    
    
    private func ringEndPosition(progress: Double) -> CGPoint{
        let endAngle = 360 * self.progress + self.startAngle
        let endAngleRad = endAngle * .pi / 360.0
        
        return CGPoint(x: radius*cos(endAngleRad), y: radius*sin(endAngleRad))
    }
    
    private var ringEndShadowOffset: CGPoint {
        let shadowPosition = self.ringEndPosition(progress: self.progress+0.02)
        let circlePosition = self.ringEndPosition(progress: self.progress)
        
        return CGPoint(x: shadowPosition.x - circlePosition.x,
                       y: shadowPosition.y-circlePosition.y)
    }
    

    
    var body: some View {
        ZStack{
            Circle()
                .stroke(self.color.opacity(0.15), lineWidth: self.thickness)
   
          
            RingShape(progress: self.progress, thickness: self.thickness)
                .fill(AngularGradient(gradient: self.gradient,
                                      center: .center,
                                      startAngle: .degrees(self.startAngle),
                                      endAngle: .degrees(360*self.progress + self.startAngle)))
                .animateProgressText(progress: self.progress, textColor: self.color)
            
            RingEnd(progress: self.progress,startAngle: self.startAngle, ringRadius: self.radius)
                .frame(width: self.thickness, height: self.thickness)
                .foregroundColor(self.progress > self.circleThreshold ? self.gradient.stops[1].color : Color.clear)
                .shadow(color: self.progress > self.circleThreshold ? Color.black.opacity(0.12) : Color.clear, radius: 2, x: self.ringEndShadowOffset.x, y: self.ringEndShadowOffset.y)
        }
        .frame(width: self.width, height: self.width, alignment: .center)
        .animation(.easeInOut(duration: 1.0), value: self.progress)
    }
}


struct RingShape: Shape {
    var progress: Double = 0.0
    var thickness: CGFloat = 25.0
    
    let startAngle: Double = -90.0
    
    
    var animatableData: Double{
        get {progress}
        set {progress = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
        let radius = min(rect.width, rect.height)/2.0
        
        path.addArc(center: center, radius: radius,
                    startAngle: .degrees(self.startAngle),
                    endAngle: .degrees(360*self.progress+self.startAngle),
                    clockwise: false)
        return path.strokedPath(.init(lineWidth: self.thickness, lineCap: .round))
    }
}


struct RingEnd: Shape{
    var progress: Double = 0.0
    var startAngle: Double = -90.0
    var ringRadius: Double
    
    
    var animatableData: Double{
        get{progress}
        set{progress = newValue}
    }
    
    private var position : CGPoint{
        let endAngle = 360 * self.progress + self.startAngle
        let endAngleRad = endAngle * .pi / 180.0
        
        let x = ringRadius*cos(endAngleRad)
        let y = ringRadius*sin(endAngleRad)
        
        return CGPoint(x: x, y: y)
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //Apaño para no pintar el círculo si progress = 0%
        guard self.progress > 0.0 else {
            return path
        }
        
        let frame = CGRect(x: self.position.x, y: self.position.y,
                           width: rect.size.width, height: rect.size.height)
        
        path.addRoundedRect(in: frame, cornerSize: frame.size)
        
        return path
    }
}


struct ProgressText: AnimatableModifier {
    var progress: Double = 0.0
    var textColor: Color = .primary
    
    private var progressText: String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        
        return formatter.string(from: NSNumber(value: self.progress)) ?? "0%"
    }
    
    var animatableData: Double {
        get{ progress }
        set{ progress = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text(self.progressText)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(self.textColor)
                    .animation(nil)
            )
    }
    
}


extension View{
    func animateProgressText(progress: Double, textColor: Color = Color.primary) -> some View{
        self.modifier(ProgressText(progress: progress, textColor: textColor))
    }
}



struct ProgressRing_Library: LibraryContentProvider{
    @LibraryContentBuilder var views: [LibraryItem] {
        LibraryItem(ProgressRing(thickness: 15.0, width: 150.0, gradient: Gradient(colors: [.darkGreen, .lightGreen]), progress: .constant(1.0)), title: "Progress Ring - Small", category: .control)
        
        
        LibraryItem(ProgressRing(thickness: 25.0, width: 250.0, gradient: Gradient(colors: [.darkPurple, .lightPurple]), progress: .constant(1.0)), title: "Progress Ring - Big", category: .control)
    }
    
    @LibraryContentBuilder
    func modifiers(base: Circle) -> [LibraryItem] {
        LibraryItem(base.animateProgressText(progress: 1.0), title: "Progress Text", category: .control)
    }
}


#Preview ("Progress Ring (50%)") {
    ProgressRing(progress: .constant(0.5))
}

#Preview ("Progress Ring (90%)") {
    ProgressRing(progress: .constant(0.9))
}

#Preview ("Progress Ring (150%)") {
    ProgressRing(progress: .constant(1.5))
}
