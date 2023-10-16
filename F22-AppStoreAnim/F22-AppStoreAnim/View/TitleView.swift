//
//  CardView.swift
//  F22-AppStoreAnim
//
//  Created by Juan Gabriel Gomila Salas on 16/10/23.
//

import SwiftUI

struct TitleView: View {
    
    let category: String
    let title: String
    let subtitle: String
    
    
    @Binding var isFullContent: Bool
    
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            Rectangle()
                .frame(minHeight: 100, maxHeight: 150)
                .foregroundStyle(.white)
                .overlay(
                    HStack{
                        VStack(alignment: .leading, content: {
                            Text(self.category.uppercased())
                                .font(.subheadline)
                                .bold()
                                .foregroundStyle(Color.secondary)
                            
                            Text(self.title)
                                .font(.title)
                                .bold()
                                .foregroundStyle(Color.primary)
                                .minimumScaleFactor(0.2)
                                .lineLimit(2)
                                .padding(.bottom, 8)
                            
                            if !self.isFullContent {
                                Text(self.subtitle)
                                    .font(.subheadline)
                                    .foregroundStyle(Color.secondary).minimumScaleFactor(0.3)
                                    .lineLimit(3)
                            }
                        })
                        .padding()
                        
                        Spacer()
                    }
                )
        }
    }
}

#Preview("Título del artículo con subtítulo",
         traits: .fixedLayout(width: 300, height: 500)) {
    TitleView(category: articles[0].category, title: articles[0].title, subtitle: articles[0].excerpt, isFullContent: .constant(false))
}


#Preview("Título del artículo", traits: .fixedLayout(width: 300, height: 500)) {
    TitleView(category: articles[0].category, title: articles[0].title, subtitle: articles[0].excerpt, isFullContent: .constant(true))
}
