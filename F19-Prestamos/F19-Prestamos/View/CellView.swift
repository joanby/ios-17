//
//  CellView.swift
//  F19-Prestamos
//
//  Created by Juan Gabriel Gomila Salas on 5/10/23.
//

import SwiftUI

struct CellView: View {
    
    var loan: Loan
    
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading, content: {
                Text(loan.name)
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .foregroundStyle(.teal)
                
                Text(loan.country)
                    .font(.system(.subheadline, design: .rounded))
                
                Text(loan.use)
                    .font(.system(.caption, design: .rounded))
            })
            
            Spacer()
            
            
                Text("\(loan.amount) €")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.teal)
                    
        }
        .padding()
    }
}

#Preview {
    CellView(loan: Loan(name: "Juan Gabriel Gomila", country: "España", use: "Para construir un colegio", amount: 275))
}
