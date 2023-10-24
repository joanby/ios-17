//
//  LearningPathsView.swift
//  F25-Colecciones
//
//  Created by Juan Gabriel Gomila Salas on 23/10/23.
//

import SwiftUI

struct LearningPathsView: View {
    
    @State var layout = [GridItem(.adaptive(minimum: 300)), GridItem(.flexible())]
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    @State var showCourses = false
    
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                LazyVGrid(columns: self.layout, alignment: .center, spacing: 16, content: {
                    
                    ForEach(paths){ path in
                        Image(path.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(maxHeight: 220)
                            .cornerRadius(16)
                            .shadow(color: .primary.opacity(0.4), radius: 6)
                        
                        if self.showCourses {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70, maximum: 100))], content: {
                                
                                ForEach(path.photos){ photo in
                                    Image(photo.name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .frame(height: 60)
                                        .cornerRadius(16)
                                }
                                
                            })
                            .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                            .animation(.easeInOut, value: self.layout.count)
                        }
                    }
                })
                .padding(.all, 16)
                .animation(.interactiveSpring(), value: self.layout.count)
            }
            .navigationTitle("Rutas de Frogames")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    HStack{
                        Button{
                            self.showCourses.toggle()
                        } label: {
                            Image(systemName: "square.grid.3x3.topleft.filled")
                                .font(.title)
                                .foregroundStyle(.teal)
                        }
                        
                        Button {
                            let minWidth: CGFloat = {
                                
                                //iPhone landscape
                                if self.verticalSizeClass == .compact {
                                    return 250
                                }
                                
                                //iPad
                                if self.horizontalSizeClass == .regular && self.verticalSizeClass == .regular {
                                    return 500
                                }
                                
                                //iPhone Portrait
                                
                                return 125
                                
                            }()
                            
                            self.layout = self.layout.count == 1 ? [GridItem(.adaptive(minimum: minWidth)), GridItem(.flexible())] : [GridItem(.flexible())]
                        } label: {
                            Image(systemName: "square.grid.2x2.fill")
                                .font(.title)
                                .foregroundStyle(.teal)
                        }
                    }
                }
            }
        }
        .onChange(of: verticalSizeClass){
            
            print("Hemos cambiado orientación")
            
            self.layout = [GridItem(.adaptive(minimum: verticalSizeClass == .regular ? 125 : 250)), GridItem(.flexible())]
            
        }.onAppear{
            switch(self.horizontalSizeClass, self.verticalSizeClass){
                
            case (.compact, .regular): //iPhone Portrait
                self.layout = [GridItem()]
                break
            case (_, .compact): //iPhone Landscape
                self.layout = [GridItem(.adaptive(minimum: 250)), GridItem(.flexible())]
                break
                
            case (.regular, .regular): //iPad
                self.layout = [GridItem(.adaptive(minimum: 500)), GridItem(.flexible())]
                break
            default:
                break
            }
        }
    }
}

#Preview {
    LearningPathsView()
}
