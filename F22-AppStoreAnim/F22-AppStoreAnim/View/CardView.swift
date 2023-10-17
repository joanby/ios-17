//
//  CardView.swift
//  F22-AppStoreAnim
//
//  Created by Juan Gabriel Gomila Salas on 17/10/23.
//

import SwiftUI

struct CardView: View {
    
    let category: String
    let title: String
    let subtitle: String
    let image: UIImage
    var content: String = ""
    
    @Binding var isFullContent: Bool
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                ScrollView{
                    VStack(alignment: .leading, content: {
                        
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: self.isFullContent ? geometry.size.height*0.6: min(500,  self.image.size.height))
                            .border(Color(.sRGB, red: 120/255, green: 210/255, blue: 215/255, opacity: 0.2), width: self.isFullContent ? 0 : 3)
                            .cornerRadius(16)
                            .overlay(
                                TitleView(category: self.category,
                                          title: self.title,
                                          subtitle: self.subtitle,
                                          isFullContent: self.$isFullContent)
                                .cornerRadius(self.isFullContent ? 0 : 16)
                            )
                        
                        
                        if self.isFullContent{
                            Text(self.content)
                                .foregroundStyle(Color(.darkGray))
                                .font(.system(.body, design: .rounded))
                                .padding(.horizontal)
                                .padding(.bottom, 48)
                                .transition(.move(edge: .bottom))
                        }
                        
                        
                    })
                }
                .shadow(color: Color(.sRGB, red: 50/255, green: 50/255, blue: 50/255, opacity: 0.3), radius: self.isFullContent ? 0 : 16)
                
                if self.isFullContent {
                    HStack{
                        Spacer()
                        Button{
                            withAnimation(.easeInOut){
                                self.isFullContent = false
                            }
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(Color.gray)
                                .opacity(0.7)
                        }.padding(16)
                    }
                }
            }
        }
    }
}

#Preview("Tarjeta sin contenido") {
    CardView(category: articles[0].category,
             title: articles[0].title,
             subtitle: articles[0].excerpt,
             image: UIImage(named: articles[0].image)!,
             isFullContent: .constant(false))
}

#Preview("Tarjeta con contenido") {
    CardView(category: articles[0].category,
             title: articles[0].title,
             subtitle: articles[0].excerpt,
             image: UIImage(named: articles[2].image)!,
             content: articles[0].content,
             isFullContent: .constant(true))
}
