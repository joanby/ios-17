//
//  PaymentDetailView.swift
//  F30-Finanzas
//
//  Created by Juan Gabriel Gomila Salas on 18/12/23.
//

import SwiftUI

struct PaymentDetailView: View {
    
    private let viewModel: PaymentDetailViewModel
    private let payment: PaymentRecord
    
    init(payment: PaymentRecord) {
        self.viewModel = PaymentDetailViewModel(payment: payment)
        self.payment = payment
    }
    
    
    var body: some View {
        VStack{
            
            TitleView(viewModel: self.viewModel)
                .padding(.top, 16)
            Image(self.viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
            
            Divider()
                .padding(.horizontal)
            
            HStack(alignment: .top, content: {
                VStack(alignment: .leading, spacing: 4, content: {
                    Text(self.viewModel.name)
                        .font(.system(.headline))
                        .fontWeight(.bold)
                    
                    Text(self.viewModel.date)
                        .font(.system(.subheadline))
                        .fontWeight(.semibold)
                        .foregroundStyle(.teal)
                        
                    Text(self.viewModel.location)
                        .font(.system(.subheadline))
                        .fontWeight(.semibold)
                        .foregroundStyle(.teal)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                })
                .padding(.horizontal)
                
                Spacer()
                
                VStack(alignment: .trailing, content: {
                    Text(self.viewModel.amount)
                        .font(.title)
                        .fontWeight(.bold)
                })
                .padding(.trailing)
            })
            .padding(.vertical)
            
            Divider()
                .foregroundStyle(.teal)
                .padding(.horizontal)
            
            
            if self.viewModel.notes != "" {
                Group{
                    Text("Notas")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                    
                    Text(self.viewModel.notes)
                        .font(.caption)
                    
                    Divider()
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}

#Preview {
    PaymentDetailView(payment:  PaymentRecord(date: Date.today, name: "Curso de iOS 17", location: "Web de Frogames", amount: 99.99, notes: "En un lugar de la maancha", type: .expense))
}

struct TitleView: View {
    
    var viewModel: PaymentDetailViewModel
    
    var body: some View {
        HStack{
            Text("Detalles del Registro")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(self.viewModel.payment.type == .expense ? Color("Expense") : Color("Income"))

            Image(systemName: self.viewModel.typeIcon)
                .foregroundStyle(self.viewModel.payment.type == .expense ? Color("Expense") : Color("Income"))
            
        }
        .padding(16)
    }
}
