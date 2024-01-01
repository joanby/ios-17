//
//  ContentView.swift
//  F31-Tabs
//
//  Created by Juan Gabriel Gomila Salas on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack {
                TabView(selection: $selection){
                    
                    Text("Inicio")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "house")
                            Text("Inicio")
                        }
                        .tag(0)
                    
                    
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
                
                HStack{
                    Button{
                        selection = (selection + 3) % 4
                    } label: {
                        Text("Anterior")
                            .font(.system(.headline, design: .rounded))
                            .padding()
                            .foregroundStyle(.white)
                            .background(.teal)
                            .cornerRadius(10)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Button{
                        selection = (selection + 1) % 4
                    } label: {
                        Text("Siguiente")
                            .font(.system(.headline, design: .rounded))
                            .padding()
                            .foregroundStyle(.white)
                            .background(.teal)
                            .cornerRadius(10)
                            .padding()
                    }
                    
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
