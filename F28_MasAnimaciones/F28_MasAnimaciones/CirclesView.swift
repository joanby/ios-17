//
//  CirclesView.swift
//  F28_MasAnimaciones
//
//  Created by Juan Gabriel Gomila Salas on 23/11/23.
//

import SwiftUI

struct CirclesView: View {
    
    @State private var swap = false
    
    @Namespace private var circleTransition
    
    
    var body: some View {
        
        if self.swap{
            //Después del intercambio, el morado irá a la izquierda, y el naranja irá a la derecha
            
            VStack{
                
                Circle()
                    .fill(.purple)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "purpleCircle", in: self.circleTransition)
                
                Spacer()
                
                Circle()
                    .fill(.orange)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "orangeCircle", in: self.circleTransition)

            }
            .frame(width: 300)
            .onTapGesture {
                withAnimation {
                    self.swap.toggle()
                }
            }
            
        } else {
            //Antes del intercambio, el naranjá irá a la izquierda, y el morado irá a la derecha
            
            VStack{
                
                Circle()
                    .fill(.orange)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "orangeCircle", in: self.circleTransition)
                
                Spacer()
                
                Circle()
                    .fill(.purple)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "purpleCircle", in: self.circleTransition)
                
                

            }
            .frame(width: 300)
            .onTapGesture {
                withAnimation {
                    self.swap.toggle()
                }
            }
        }
    
    }
}

#Preview {
    CirclesView()
}


struct SwapPictures: View {
    
    @State private var swap = false
    
    @Namespace private var pictureTransition
    
    var body: some View {
        
        if self.swap{
            VStack{
                Image("ios10")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 250)
                    .matchedGeometryEffect(id: "im1", in: self.pictureTransition)
                    .clipped()
                
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 60))
                    .onTapGesture {
                        withAnimation(.bouncy){
                            self.swap.toggle()
                        }
                    }
                Image("matematicas-probabilidad-ml-r-python")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 250)
                    .matchedGeometryEffect(id: "im2", in: self.pictureTransition)
                    .clipped()
                
            }
            
        }else{
            VStack{
                
            Image("matematicas-probabilidad-ml-r-python")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 250)
                .matchedGeometryEffect(id: "im2", in: self.pictureTransition)
                .clipped()
                
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 60))
                    .onTapGesture {
                        withAnimation(.bouncy){
                            self.swap.toggle()
                        }
                    }
                
                Image("ios10")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 250)
                    .matchedGeometryEffect(id: "im1", in: self.pictureTransition)
                    .clipped()
                
            }
        }
        
        
    }
}

#Preview("SwapPictures"){
    SwapPictures()
}
