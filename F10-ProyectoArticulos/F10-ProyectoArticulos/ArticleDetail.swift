//
//  ArticleDetail.swift
//  F10-ProyectoArticulos
//
//  Created by Juan Gabriel Gomila Salas on 24/9/23.
//

import SwiftUI

struct ArticleDetail: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showAlert = false
    
    var article: Article
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Group{
                Text(article.title)
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                
                Text("Redactado por \(article.author)".uppercased())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(article.url.lowercased())
                    .font(.callout)
                    .fontWeight(.thin)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom, 2)
            .padding(.horizontal, 16)
            
            Group{
                Text("\(article.excerpt)")
                    .bold()

                Text(article.content)
            }
            .font(.body)
            .padding(16)
            .lineLimit(100)
            .multilineTextAlignment(.leading)
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                }
                .tint(.white)
            }
        }
        
        
    }
}

#Preview {
    NavigationStack{
        ArticleDetail(article: articles[0])
            .navigationTitle("Artículo")
    }
}
