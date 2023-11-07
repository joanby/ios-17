//
//  ContentView.swift
//  F26-Actividad
//
//  Created by Juan Gabriel Gomila Salas on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var progress = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                ProgressRing(thickness: 25, 
                             width: 190,
                             color: .darkBlue,
                             gradient: Gradient(colors: [.darkBlue, .lightBlue]),
                             progress: self.$progress)
                
                ProgressRing(thickness: 25,
                             width: 250,
                             color: .darkGreen,
                             gradient: Gradient(colors: [.darkGreen, .lightGreen]),
                             progress: self.$progress)
                
                ProgressRing(thickness: 25,
                             width: 310,
                             color: .darkRed,
                             gradient: Gradient(colors: [.darkRed, .lightRed]),
                             progress: self.$progress)
            }
        }
        
        HStack{
            
            
            Group{
                Text("0 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 0.0
                    }
                
                Text("50 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 0.5
                    }
                
                Text("100 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 1.0
                    }
                
                Text("120 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 1.2
                    }
            }
            .padding(12)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .continuous))
            .padding(12)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

