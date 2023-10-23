//
//  ContentView.swift
//  F24-Desplegables
//
//  Created by Juan Gabriel Gomila Salas on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            
            ForEach(learningPaths){ path in
                Section(header: HStack{
                    
                    Image(path.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 40)
                    
                    Text(path.name)
                        .font(.system(.subheadline))
                        .fontWeight(.heavy)
                    
                    
                }.padding()
                ) {
                    OutlineGroup(path.submenuitems ?? [MenuItem](), children: \.submenuitems){ item in
                        HStack{
                            Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 40)
                        
                            Text(item.name)
                            .font(.system(.title3, design: .rounded))
                            .bold()
                        }
                    }
                }
            }
        }
        //.listStyle(.grouped)
    }
}

#Preview {
    ContentView()
}
