//
//  WeatherData.swift
//  F33-Charts
//
//  Created by Juan Gabriel Gomila Salas on 8/1/24.
//

import Foundation

struct WeatherData: Identifiable {
    let id = UUID()
    let date : Date
    let temperature: Double
    //TODO: podemos guardar información de precipitaciones, humedad, tiempo (soleado, nublado etc...)
    
    init(year: Int, month: Int, day: Int, temperature: Double) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.temperature = temperature
    }
    
}
