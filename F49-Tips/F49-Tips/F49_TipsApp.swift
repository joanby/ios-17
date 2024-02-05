//
//  F49_TipsApp.swift
//  F49-Tips
//
//  Created by Juan Gabriel Gomila Salas on 4/2/24.
//

import SwiftUI
import TipKit

@main
struct F49_TipsApp: App {
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .task {
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
