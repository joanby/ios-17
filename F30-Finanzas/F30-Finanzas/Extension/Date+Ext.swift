//
//  Date+Ext.swift
//  F30-Finanzas
//
//  Created by Juan Gabriel Gomila Salas on 11/12/23.
//

import Foundation

extension Date {
    
    static var today: Date {
        return Date()
    }
    
    static var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }
    
    static var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value:  1, to: Date())!
    }
    
    var day : Int {
        return Calendar.current.component(.day, from: self)
    }
    
    var month : Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var year : Int {
        return Calendar.current.component(.year, from: self)
    }
    
    
    static func fromString(string: String, with format: String = "yyyy-MM-dd") -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)
    }
    
    func string(with format: String = "dd MMM yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
