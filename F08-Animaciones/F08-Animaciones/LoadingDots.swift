//
//  LoadingDots.swift
//  F08-Animaciones
//
//  Created by Juan Gabriel Gomila Salas on 20/9/23.
//

import SwiftUI

struct LoadingDots: View {
    
    @State private var isLoading = false
    var body: some View {
        HStack{
            ForEach(0...5, id: \.self){ idx in
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.teal)
                    .scaleEffect(isLoading ? 0 : 1)
                    .animation(.linear(duration: 0.7).repeatForever().delay(Double(idx)/6), value: isLoading)
            }
        }.onAppear(){
            isLoading = true
        }
    }
}

#Preview {
    LoadingDots()
}
