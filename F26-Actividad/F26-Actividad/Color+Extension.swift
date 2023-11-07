//
//  Color+Extension.swift
//  F26-Actividad
//
//  Created by Juan Gabriel Gomila Salas on 2/11/23.
//

import SwiftUI

extension Color {
    
    public init(red: Int, green: Int, blue: Int, alpha: Double = 1.0){
        let redVal = Double(red) / 255.0
        let greenVal = Double(green) / 255.0
        let blueVal = Double(blue) / 255.0
        
        self.init(red: redVal, green: greenVal, blue: blueVal, opacity: alpha)
    }
    
    
    public static let lightRed = Color(red: 230, green: 75, blue: 60)
    public static let darkRed  = Color(red: 190, green: 60, blue: 40)
    
    public static let lightGreen = Color(red: 50, green: 210, blue: 110)
    public static let darkGreen  = Color(red: 35, green: 175, blue: 95)
    
    public static let lightBlue = Color(red: 50, green: 150, blue: 220)
    public static let darkBlue  = Color(red: 35, green: 130, blue: 185)

    public static let lightPurple = Color(red: 150, green: 90, blue: 180)
    public static let darkPurple  = Color(red: 140, green: 70, blue: 170)

    public static let lightOrange = Color(red: 230, green: 130, blue: 30)
    public static let darkOrange  = Color(red: 210, green:  90, blue: 10)
    
    public static let lightYellow = Color(red: 240, green: 150, blue: 20)
    public static let darkYellow  = Color(red: 230, green: 130, blue: 10)

    public static let bgColor = Color(red: 70, green: 60, blue: 200)

}

