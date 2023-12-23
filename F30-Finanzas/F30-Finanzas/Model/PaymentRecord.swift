//
//  Item.swift
//  F30-Finanzas
//
//  Created by Juan Gabriel Gomila Salas on 11/12/23.
//

import Foundation
import SwiftData


enum PaymentCategory: Int{
    case income = 0
    case expense = 1
}


@Model class PaymentRecord {
    @Attribute(.unique) var paymentID: UUID
    var date: Date
    var name: String
    var location: String?
    var amount: Double
    var notes: String?
    @Transient var type: PaymentCategory {
        get {
            PaymentCategory(rawValue: Int(self.typeNum)) ?? .expense
        }
        set{
            self.typeNum = Int(newValue.rawValue)
        }
    }
    @Attribute(originalName: "type") var typeNum: PaymentCategory.RawValue
    
    init(paymentID: UUID = UUID(), date: Date, name: String, location: String? = nil, amount: Double, notes: String? = nil, type: PaymentCategory) {
        self.paymentID = paymentID
        self.date = date
        self.name = name
        self.location = location
        self.amount = amount
        self.notes = notes
        self.typeNum = Int(type.rawValue)
        self.type = type
    }
}
