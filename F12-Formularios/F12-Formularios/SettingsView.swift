//
//  SettingsView.swift
//  F12-Formularios
//
//  Created by Juan Gabriel Gomila Salas on 26/9/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedOrder = DisplayOrder.alphabetical
    @State private var showPurchasedOnly = false
    @State private var showFavouriteOnly = false
    @State private var maxDifficulty = 4
    @State private var minPrice : Float = 0.0
    @State private var maxPrice : Float = 50.0

    @EnvironmentObject var settings: SettingsFactory

    var body: some View {
        NavigationStack{
            Form{
                Section(header:Text("Orden de los cursos")){
                    Picker(selection: $selectedOrder, label: Text("Orden:") ){
                        ForEach(DisplayOrder.allCases, id: \.self){ order in
                            Text(order.text)
                        }
                    }
                }
                
                Section(header: Text("Filtrar los cursos")) {
                    Toggle(isOn: $showPurchasedOnly){
                        Text("Ver solo cursos comprados")
                    }
                    Toggle(isOn: $showFavouriteOnly){
                        Text("Ver solo cursos favoritos")
                    }
                    
                    Stepper {
                        self.maxDifficulty += 1
                        if self.maxDifficulty > 4 {
                            self.maxDifficulty = 4
                        }
                    } onDecrement: {
                        self.maxDifficulty -= 1
                        if self.maxDifficulty < 1{
                            self.maxDifficulty = 1
                        }
                    } label: {
                        Text("Dificultad \(Image(systemName:"cellularbars", variableValue: Double(maxDifficulty)/4)) o inferior")
                    }
                    
                    DisclosureGroup("Rango de precios"){
                        Text("Cursos entre \(Int(minPrice)) y \(Int(maxPrice)) €")
                        
                       Slider(value: $minPrice, in: 0...50, step: 1){
                            Text("")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("50")
                        }
                         
                        Slider(value: $maxPrice, in: 0...50, step: 1){
                            Text("")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("50")
                        }
                   
                    }

                }
            }
            .navigationTitle("Ajustes")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    } label: {
                        Text("Cerrar")
                            .foregroundStyle(.primary)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        self.settings.showFavouriteOnly = self.showFavouriteOnly
                        self.settings.showPurchasedOnly = self.showPurchasedOnly
                        self.settings.displayOrder = self.selectedOrder.rawValue
                        self.settings.maxDifficultyLevel = self.maxDifficulty
                        
                        
                        if (self.minPrice > self.maxPrice){
                            let aux = self.minPrice
                            self.minPrice = self.maxPrice
                            self.maxPrice = aux
                        }
                        
                        self.settings.minPriceShow = self.minPrice
                        self.settings.maxPriceShow = self.maxPrice
                        
                        dismiss()
                    } label: {
                        Text("Guardar")
                            .foregroundStyle(.primary)
                    }
                }
            }
        }.onAppear{
            
            self.showFavouriteOnly = self.settings.showFavouriteOnly
            self.showPurchasedOnly = self.settings.showPurchasedOnly
            self.selectedOrder = DisplayOrder(type: self.settings.displayOrder)
            self.maxDifficulty = self.settings.maxDifficultyLevel
            self.minPrice = self.settings.minPriceShow
            self.maxPrice = self.settings.maxPriceShow
            
            if(self.maxPrice <= self.minPrice){
                self.maxPrice = 50.0
                self.minPrice = 0.0
            }
        }
    }
}

#Preview {
    SettingsView().environmentObject(SettingsFactory())
}
