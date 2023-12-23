//
//  NumberFormatter+Ext.swift
//  F30-Finanzas
//
//  Created by Juan Gabriel Gomila Salas on 11/12/23.
//

import Foundation

extension NumberFormatter{
    
    static func currency(from value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        
        let formattedValue = formatter.string(from: NSNumber(value: value)) ?? "0.00"
        
        return formattedValue + " €"
    }
}
