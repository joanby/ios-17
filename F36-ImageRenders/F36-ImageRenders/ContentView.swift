//
//  ContentView.swift
//  F36-ImageRenders
//
//  Created by Juan Gabriel Gomila Salas on 10/1/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    
   var chartView = ChartView()
    
    var body: some View {
        VStack (spacing: 24){
            self.chartView
            
            HStack{
                Button {
                    UIImageWriteToSavedPhotosAlbum(self.generateSnapshot(), nil, nil, nil)
                } label: {
                    Label("Guardar en Fotos", systemImage: "photo")
                }
                .buttonStyle(.borderedProminent)
                .tint(.teal)
                
                
                ShareLink(item: Image(uiImage: self.generateSnapshot()),
                          preview: SharePreview("Gráfico de Temperaturas",
                                                image: Image(uiImage: self.generateSnapshot()))){
                    Label("Compartir", systemImage: "square.and.arrow.up")
                }
                .buttonStyle(.borderedProminent)
                .tint(.teal)
            }
            
        }
    }
    
    
    @MainActor
    private func generateSnapshot() -> UIImage {
        let renderer = ImageRenderer(content: self.chartView)
        renderer.scale = UIScreen.main.scale
        return renderer.uiImage ?? UIImage()
    }
}

#Preview {
    ContentView()
}
