//
//  PaymentDetailViewModel.swift
//  F30-Finanzas
//
//  Created by Juan Gabriel Gomila Salas on 20/12/23.
//

import Foundation

struct PaymentDetailViewModel {
    
    var payment: PaymentRecord
    
    var name: String {
        return self.payment.name
    }
    
    var date: String {
        return self.payment.date.string()
    }
    
    var location: String {
        return self.payment.location ?? ""
    }
    
    var image: String = "money"
    
    var typeIcon: String {
        
        let icon : String
        
        switch self.payment.type {
        case .expense:
            icon = "arrowshape.down.circle.fill"
        case .income:
            icon = "arrowshape.up.circle.fill"
        }
        return icon
    }
    
    var amount: String {
        let amountValue = NumberFormatter.currency(from: self.payment.amount)
        let formattedValue = (self.payment.type == .income ? "+" : "-") + amountValue
        return formattedValue
    }
    
    var notes: String {
        return self.payment.notes ?? ""
    }
    
    
    init(payment: PaymentRecord) {
        self.payment = payment
    }
}
