//
//  WeatherData.swift
//  F36-ImageRenders
//
//  Created by Juan Gabriel Gomila Salas on 10/1/24.
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


let madData = [
    WeatherData(year: 2022, month: 9, day: 1, temperature: 32),
    WeatherData(year: 2022, month: 10, day: 1, temperature: 27),
    WeatherData(year: 2022, month: 11, day: 1, temperature: 15),
    WeatherData(year: 2022, month: 12, day: 1, temperature: 7),
    WeatherData(year: 2023, month: 1, day: 1, temperature: 1),
    WeatherData(year: 2023, month: 2, day: 1, temperature: 3),
    WeatherData(year: 2023, month: 3, day: 1, temperature: 8),
    WeatherData(year: 2023, month: 4, day: 1, temperature: 12),
    WeatherData(year: 2023, month: 5, day: 1, temperature: 19),
    WeatherData(year: 2023, month: 6, day: 1, temperature: 21),
    WeatherData(year: 2023, month: 7, day: 1, temperature: 30),
    WeatherData(year: 2023, month: 8, day: 1, temperature: 35)
]
let bcnData = [
    WeatherData(year: 2022, month: 9, day: 1, temperature: 23),
    WeatherData(year: 2022, month: 10, day: 1, temperature: 20),
    WeatherData(year: 2022, month: 11, day: 1, temperature: 15),
    WeatherData(year: 2022, month: 12, day: 1, temperature: 12),
    WeatherData(year: 2023, month: 1, day: 1, temperature: 12),
    WeatherData(year: 2023, month: 2, day: 1, temperature: 11),
    WeatherData(year: 2023, month: 3, day: 1, temperature: 14),
    WeatherData(year: 2023, month: 4, day: 1, temperature: 17),
    WeatherData(year: 2023, month: 5, day: 1, temperature: 20),
    WeatherData(year: 2023, month: 6, day: 1, temperature: 24),
    WeatherData(year: 2023, month: 7, day: 1, temperature: 26),
    WeatherData(year: 2023, month: 8, day: 1, temperature: 26)
]
let palData = [
    WeatherData(year: 2022, month: 9, day: 1, temperature: 23),
    WeatherData(year: 2022, month: 10, day: 1, temperature: 22),
    WeatherData(year: 2022, month: 11, day: 1, temperature: 15),
    WeatherData(year: 2022, month: 12, day: 1, temperature: 12),
    WeatherData(year: 2023, month: 1, day: 1, temperature: 11),
    WeatherData(year: 2023, month: 2, day: 1, temperature: 12),
    WeatherData(year: 2023, month: 3, day: 1, temperature: 13),
    WeatherData(year: 2023, month: 4, day: 1, temperature: 15),
    WeatherData(year: 2023, month: 5, day: 1, temperature: 17),
    WeatherData(year: 2023, month: 6, day: 1, temperature: 22),
    WeatherData(year: 2023, month: 7, day: 1, temperature: 26),
    WeatherData(year: 2023, month: 8, day: 1, temperature: 27)
]
