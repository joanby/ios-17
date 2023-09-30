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
        .ignoresSafeArea()
        .overlay(
        
            HStack {
                Spacer()
                VStack {
                    Button{
                        self.showAlert = true
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.gray)
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 24)
                    Spacer()
                }
            }
        ).alert("¡Cuidado!", isPresented: $showAlert, actions: {
            Button{
                dismiss()
            } label: {
                Text("Sí")
            }
            
            Button(role: .cancel, action: {}) {
                Text("No")
            }
        }, message: {
            Text("¿Estás seguro que quieres cerrar el artículo actual?")
        })
        
    }
}

#Preview {
    NavigationStack{
        ArticleDetail(article: articles[0])
            .navigationTitle("Artículo")
    }
}
