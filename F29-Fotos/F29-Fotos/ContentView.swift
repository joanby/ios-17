//
//  ContentView.swift
//  F29-Fotos
//
//  Created by Juan Gabriel Gomila Salas on 29/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var photos = samplePhotos
    @State private var selectedPhotos: [Photo] = []
    @State private var selectedPhotoID: UUID?
    
    
    @Namespace private var photoTransition
    
    
    var body: some View {
        VStack {
            ScrollView{
                HStack{
                    Text("Fotos")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                    Spacer()
                }
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], content: {
                    
                    ForEach(self.photos){ photo in
                        Image(photo.name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50)
                            .cornerRadius(5)
                            .onTapGesture {
                                self.selectedPhotos.append(photo)
                                self.selectedPhotoID = photo.id
                                if let idx = self.photos.firstIndex(where: { $0.id == self.selectedPhotoID }){
                                    self.photos.remove(at: idx)
                                }
                            }
                            .matchedGeometryEffect(id: photo.id, in: self.photoTransition)
                    }
                    
                })
            }
            
            
            //DOCK INFERIOR
            ScrollViewReader { scrollProxy  in
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: [GridItem()], content: {
                        ForEach(self.selectedPhotos){ photo in
                            Image(photo.name)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                                .frame(height: 100)
                                .cornerRadius(5)
                                .id(photo.id)
                                .onTapGesture {
                                    self.photos.append(photo)
                                    self.selectedPhotoID = photo.id
                                    if let idx = self.selectedPhotos.firstIndex(where: {$0.id == photo.id}){
                                        self.selectedPhotos.remove(at: idx)
                                    }
                                }
                                .matchedGeometryEffect(id: photo.id, in: self.photoTransition)
                            
                        }
                    })
                }
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onChange(of: self.selectedPhotoID){ oldID, newID in
                    withAnimation {
                        scrollProxy.scrollTo(newID)
                    }
                }
            }
            
        }
        .padding()
        .animation(.interactiveSpring(), value: self.selectedPhotoID)
    }
}

#Preview {
    ContentView()
}
