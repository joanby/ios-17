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
                
                
                Button {
                    self.generatePDF()
                } label: {
                    Label("Guardar en PDF", systemImage: "doc.plaintext")
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
    
    
    @MainActor
    private func generatePDF() {
        // Generar el path
        guard let docsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                           in: .userDomainMask).first
        else { return }
        
        let renderURL = docsDirectory.appending(path: "temperaturas.pdf")
        
        // Preparar CGGraphics para dibujo
        if let consumer = CGDataConsumer(url: renderURL as CFURL),
        let pdfContext = CGContext(consumer: consumer, mediaBox: nil, nil){
            // Rendear el resultado (método render)
            let renderer = ImageRenderer(content: self.chartView)
            renderer.render { size, renderer in
                let options : [CFString: Any] = [kCGPDFContextMediaBox : CGRect(origin: .zero, size: size)]
                
                pdfContext.beginPDFPage(options as CFDictionary)
                pdfContext.translateBy(x: 100, y: 200)
                renderer(pdfContext)
                pdfContext.endPDFPage()
                pdfContext.closePDF()
                
                print("Hemos guardado el PDF en \(renderURL.path())")
            }
        }
    }
}

#Preview {
    ContentView()
}
