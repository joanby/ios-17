//
//  ContentView.swift
//  F22-AppStoreAnim
//
//  Created by Juan Gabriel Gomila Salas on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showFullContent = false
    
    @State private var selectedArticle: Article?
    
    @Namespace var nsArticle
    
    var body: some View {
        ZStack(alignment: .top){
            ScrollView {
                VStack(spacing: 42) {
                    TopView()
                        .padding(.horizontal, 24)
                    
                    ForEach(articles) { article in
                        
                        let img = UIImage(named: article.image)!
                        
                        CardView(category: article.category, title: article.title, subtitle: article.excerpt, image: img, content: article.content, isFullContent: self.$showFullContent)
                            .padding(.horizontal, 16)
                            .frame(height: min(500, img.size.height))
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.15)){
                                    self.selectedArticle = article
                                    self.showFullContent.toggle()
                                }
                            }
                            .matchedGeometryEffect(id: article.id, in: nsArticle)
                    }
                    
                    
                }
                .padding()
            }
            .opacity(self.showFullContent ? 0 : 1)
            
            if self.showFullContent, let selectedArticle {
                CardView(category: selectedArticle.category, title: selectedArticle.title, subtitle: selectedArticle.excerpt, image: UIImage(named: selectedArticle.image)!, content: selectedArticle.content, isFullContent: self.$showFullContent)
                    .matchedGeometryEffect(id: selectedArticle.id, in: nsArticle)
                    .ignoresSafeArea()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct TopView: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline, content: {
            VStack(alignment: .leading, content: {
                Text(getCurrentDate().uppercased())
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                
                Text("Hoy")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            })
            Spacer()
            
            UserView(image: "juangabriel",
                     size: CGSize(width: 50, height: 50))
        })
    }
    
    
    
    func getCurrentDate(with format: String = "EEEE, d MMM YYYY") -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
}


struct UserView: View {
    
    let image: String
    let size: CGSize
    
    
    var body: some View {
        Image(self.image)
            .resizable()
            .scaledToFill()
            .frame(width: self.size.width, height: self.size.height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.teal, lineWidth: 2))
    }
}
