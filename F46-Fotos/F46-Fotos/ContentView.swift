//
//  ContentView.swift
//  F46-Fotos
//
//  Created by Juan Gabriel Gomila Salas on 2/2/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var selectedItems: [PhotosPickerItem] = []
    
    @State private var selectedImages: [Image] = []
    
    var body: some View {
        VStack{
            
            
            if self.selectedImages.isEmpty{
                ContentUnavailableView("No hay imágenes seleccionadas", systemImage: "photo.on.rectangle",
                description: Text("\nPara empezar, selecciona algunas imágenes desde el menú inferior"))
                .frame(height: 350)
            } else{
                ScrollView(.horizontal){
                    LazyHStack {
                        ForEach(0 ..< self.selectedImages.count, id: \.self) { idx in
                            self.selectedImages[idx]
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 24.0))
                                .padding(.horizontal, 24)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                }
                .frame(height: 350)
            }
            
            
            PhotosPicker(selection: self.$selectedItems,
                         maxSelectionCount: 4,
                         selectionBehavior: .continuousAndOrdered,
                         matching: .images) {
                Label("Selecciona una imagen", systemImage: "photo")
                    .foregroundStyle(.teal)
            }
            .photosPickerStyle(.inline)
            .frame(height: 350)
            .ignoresSafeArea()
            .padding()
            .photosPickerAccessoryVisibility(.hidden, edges: .bottom)
            .onChange(of: self.selectedItems) { oldValues, newValues in
                
                self.selectedImages.removeAll()
                
                newValues.forEach { item in
                    Task {
                        if let image = try? await item.loadTransferable(type: Image.self) {
                            self.selectedImages.append(image)
                        }
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
