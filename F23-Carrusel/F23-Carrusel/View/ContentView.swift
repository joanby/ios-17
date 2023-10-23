//
//  ContentView.swift
//  F23-Carrusel
//
//  Created by Juan Gabriel Gomila Salas on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isCardSelected = false
    
    @State private var currentIndex = 5
    
    private var padding: CGFloat = 16
    
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading, content: {
                Text("Descubre nuevos cursos")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                
                Text("Explora los cursos de Frogames Formación")
                    .font(.system(.subheadline, design: .rounded))
            }).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(.top, 24)
                .padding(.leading, 16)
                .opacity(self.isCardSelected ? 0.1 : 1.0)
                .offset(y : self.isCardSelected ? -150 : 0)
            
            GeometryReader { outerView in
                HStack(spacing:0){
                    ForEach(courses.indices, id: \.self) { idx in
                        GeometryReader { innerView in
                            CardView(title: courses[idx].title, imageName: courses[idx].image, showDetails: self.$isCardSelected)
                                .offset(y: self.isCardSelected ? -innerView.size.height*0.25 : 0)
                                .onTapGesture {
                                    withAnimation(.interpolatingSpring(.bouncy, initialVelocity: 0.2)){
                                        self.isCardSelected = true
                                    }
                                }
                        }
                        .frame(width: outerView.size.width, height: self.currentIndex == idx ? (self.isCardSelected ? outerView.size.height : 400) : 250)
                        .opacity(self.currentIndex == idx ? 1.0 : 0.65)
                        .padding(.horizontal, self.isCardSelected ? 0 : self.padding)
                    }
                }.frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
                    .offset(x: (self.isCardSelected ? 0 : -self.padding) - CGFloat(self.currentIndex)*(outerView.size.width+(self.isCardSelected ? 0 : self.padding*2)))
                    .offset(x:self.dragOffset)
                    .gesture(
                        !self.isCardSelected ?
                        DragGesture()
                            .updating(self.$dragOffset, body: { value, state, transaction in
                                state = value.translation.width
                            })
                            .onEnded({ value in
                                let threshold = outerView.size.width * 0.55
                                var newIndex = Int(-value.translation.width / threshold) + self.currentIndex
                                newIndex = min(max(newIndex, 0), courses.count-1)
                                self.currentIndex = newIndex
                            })
                        
                        : nil
                        
                    )
            }.animation(.interpolatingSpring(.bouncy), value: self.dragOffset)
            
            if self.isCardSelected{
                DetailView(title: courses[self.currentIndex].title)
                    .offset(y:200)
                    .transition(.move(edge:.bottom))
                
                Button {
                    withAnimation {
                        self.isCardSelected = false
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .opacity(0.7)
                        .contentShape(Rectangle())
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.trailing)

            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
