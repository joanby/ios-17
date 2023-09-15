//
//  ContentView.swift
//  F03-Pilas
//
//  Created by Juan Gabriel Gomila Salas on 14/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            
             TitleView()
             
             HStack(spacing: 20) {
                //Rana de Bronce
                PriceView(title: "Rana de Bronce", price: "29€", description: "Acceso Mensual", textColor: .white, backgroundColor: .brown)
                
                //Rana de Plata
                ZStack {
                    PriceView(title: "Rana de Plata", price: "145€", description: "Acceso Semianual", textColor: .black, backgroundColor: Color(red: 220/255, green: 220/255, blue: 220/255))
                    
                    Text("Ahorras 1 mes")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color.cyan)
                        .offset(x:0, y:-80)
                }
                
            }
            .padding(.horizontal)
            
           
            
            ZStack {
                PriceView(title: "Rana de Oro", price: "259€", description: "Acceso Anual", textColor: .white, backgroundColor: .yellow, icon: "dumbbell.fill")
                    .padding(.horizontal)
                
                
                Text("Ahorras 3 meses")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(Color.cyan)
                    .offset(x:0, y:80)
                
            }
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleView: View {
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 10){
                Text("Elige")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                Text("Tu Suscripción")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
            }
            Spacer()
            
        }
        .padding()
    }
}

struct PriceView: View {
    
    var title: String
    var price: String
    var description: String
    var textColor: Color
    var backgroundColor: Color
    
    var icon: String?
    
    var body: some View {
        VStack{
            
            //if icon != nil {
            if let icon = icon {
             //Hay icono
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 35, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text(description)
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding()
        .background(backgroundColor)
        .cornerRadius(15)
    }
}
