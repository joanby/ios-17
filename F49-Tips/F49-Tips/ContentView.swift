//
//  ContentView.swift
//  F49-Tips
//
//  Created by Juan Gabriel Gomila Salas on 4/2/24.
//

import SwiftUI
import TipKit


//Crear una Tip
struct FavouriteTip: Tip {
    
    var title: Text {
        Text("Guarda la foto como favorita")
    }
    
    var message: Text? {
        Text("Tus fotos favoritas aparecerán en el álbum de favoritos")
    }
    
    var image: Image? {
        Image(systemName: "heart.fill")
    }
    
    //Basado en parámetros
    /*@Parameter
    static var hasViewedGetStartedTip: Bool = false
    
    
    var rules: [Rule] {
        #Rule(Self.$hasViewedGetStartedTip) { $0 == true }
    }*/
    
    //Basado en eventos
    static let hasViewedGetStartedTip = Tips.Event(id: "hasViewedGetStartedTip")
    
    var rules: [Rule] {
        #Rule(Self.hasViewedGetStartedTip){
            $0.donations.count >= 1
        }
    }
}

//Crear una Tip
struct GetStartedTip: Tip {
    
    var title: Text {
        Text("Para empezar, haz click en la foto")
    }
    
    var message: Text? {
        Text("Haz click en la foto superior para continuar")
    }
    
    var image: Image? {
        Image(systemName: "camera")
    }
}




struct ContentView: View {
    
    private let getStartedTip = GetStartedTip()
    private let favouriteTip = FavouriteTip()
    
    @State private var showDetails = false
    
    var body: some View {
        VStack {
        
            
            Image("juangabriel")
                .resizable()
                .scaledToFit()
                .overlay(alignment: .topTrailing){
                    Image(systemName: "heart.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(.teal)
                        .padding(24)
                        .popoverTip(self.favouriteTip, arrowEdge: .top)
                }
                .onTapGesture {
                    withAnimation {
                        self.showDetails.toggle()
                    }
                    
                    self.getStartedTip.invalidate(reason: .actionPerformed)
                    
                    //FavouriteTip.hasViewedGetStartedTip = true
                    
                    Task {
                        await FavouriteTip.hasViewedGetStartedTip.donate()
                    }
                    
                    
                }
            
            if self.showDetails{
                Text("Juan Gabriel Gomila es el CEO de Frogames Formación SL e instructor online que ha enseñado a más de 500.000 estudiantes en todo el mundo.")
            }
            
            
            TipView(self.getStartedTip)
            

        }
        .padding()
    }
}

#Preview {
    ContentView()
        .task {
            try? Tips.resetDatastore()
            
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
