//
//  ContentView.swift
//  F17-Tinder
//
//  Created by Juan Gabriel Gomila Salas on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragState = DragState.inactive
    private let dragThreshold : CGFloat = 100.0
    
    @State private var lastCardIndex = 1
    @State private var finalTransition = AnyTransition.leadingBottom
    
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2{
            views.append(CardView(name: courses[index].name, 
                                  image: courses[index].image))
        }
        return views
    }()
    
    private func moveCard(){
        self.cardViews.removeFirst()
        self.lastCardIndex += 1
        
        let course = courses[self.lastCardIndex % courses.count]
        let newCard = CardView(name: course.name,
                               image: course.image)
        self.cardViews.append(newCard)
    }
    
    
    var body: some View {
        VStack {
            TopBar()
            
            ZStack{
                ForEach(self.cardViews) { cardView in
                    
                    let isTop = self.isTopCard(cardView: cardView)
                    
                    cardView
                        .zIndex(isTop ? 1 : 0)
                        .overlay{
                            ZStack{
                                
                                Image(systemName: "xmark.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 120))
                                    .opacity(self.dragState.translation.width < -self.dragThreshold && isTop ? 1.0 : 0)
                                
                                Image(systemName: "heart.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 120))
                                    .opacity(self.dragState.translation.width  > self.dragThreshold && isTop ? 1.0 : 0.0)
                                
                                
                            }
                        }
                        .offset(x: isTop ? self.dragState.translation.width : 0.0,
                                y: isTop ? self.dragState.translation.height : 0.0)
                        .scaleEffect(isTop && self.dragState.isDragging ? 0.95 : 1.0)
                        .rotationEffect(Angle(degrees: isTop ?  Double(self.dragState.translation.width / 15) : 0))
                        .animation(.interpolatingSpring(stiffness: 200, damping: 100), value: self.dragState.translation)
                        .transition(self.finalTransition)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.05)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { value, state, transaction in
                                    
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                })
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else{ return }
                                    if drag.translation.width < -self.dragThreshold {
                                        self.finalTransition = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > self.dragThreshold {
                                        self.finalTransition = .trailingBottom
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else{ return }
                                    if drag.translation.width < -self.dragThreshold || drag.translation.width > self.dragThreshold {
                                        self.moveCard()
                                    }
                                })
                        )
                
                }
            }
            
            Spacer(minLength: 24)
            BottomBar()
                .opacity(self.dragState.isDragging ? 0.0 : 1.0)
                .animation(.easeInOut, value: self.dragState.isDragging)
        }
        .padding()
    }
    
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = self.cardViews.firstIndex(where: {$0.id == cardView.id}) else {
            return false
        }
        
        return index == 0
    }
}


struct TopBar: View{
    var body: some View{
        HStack{
            Image(systemName: "line.3.horizontal")
                .font(.system(size: 35))
                .foregroundStyle(.secondary)
            Spacer()
            Image(systemName: "brain.filled.head.profile")
                .font(.system(size: 40))
                .foregroundStyle(.teal)
            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 35))
                .foregroundStyle(.secondary)
        }
        .padding(24)
    }
}


struct BottomBar: View {
    var body: some View {
        HStack{
            Image(systemName: "xmark")
                .font(.system(size: 35))
                .foregroundStyle(.red)
            
            Spacer()
            
            Button {
                //TODO: abrir el curso en la web
            } label: {
                Text("Ver el Curso")
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .background(.teal)
                    .cornerRadius(15)
            }
            
            Spacer()
            
            Image(systemName: "heart")
                .font(.system(size: 35))
                .foregroundStyle(.green)
        }
        .padding(24)
    }
}

#Preview("Content") {
    ContentView()
}

#Preview("TopBar"){
    TopBar()
}

#Preview("BottomBar"){
    BottomBar()
}


extension AnyTransition {
    static var trailingBottom : AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottom : AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}
