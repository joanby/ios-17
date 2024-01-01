//
//  NavigationTabs.swift
//  F31-Tabs
//
//  Created by Juan Gabriel Gomila Salas on 28/12/23.
//

import SwiftUI

struct NavigationTabs: View {
    
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection)  {
            NavigationStack{
                List(1...10, id: \.self){ idx in
                    NavigationLink(destination: Text("Item #\(idx)")) {
                        Text("Item #\(idx)")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Ejemplo de TabView")
                
               
            }
            
            
            .tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }.tag(0)
            
            
            Text("Favoritos")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Favoritos")
                }
                .tag(1)
            
            Text("Aprender")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "play.display")
                    Text("Aprender")
                }
                .tag(2)
            
            Text("Mi cuenta")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }
                .tag(3)
        }
        .tint(Color("TabColor"))
        
        
        
        
    }
}

#Preview {
    NavigationTabs()
}
