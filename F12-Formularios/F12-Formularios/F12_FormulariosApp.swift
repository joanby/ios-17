//
//  F12_FormulariosApp.swift
//  F12-Formularios
//
//  Created by Juan Gabriel Gomila Salas on 26/9/23.
//

import SwiftUI

@main
struct F12_FormulariosApp: App {
    
    var settings = SettingsFactory()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(self.settings)
        }
    }
}
