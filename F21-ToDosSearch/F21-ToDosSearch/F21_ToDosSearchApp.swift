//
//  F21_ToDosSearchApp.swift
//  F21-ToDosSearch
//
//  Created by Juan Gabriel Gomila Salas on 11/10/23.
//

import SwiftUI
import SwiftData

@main
struct F21_ToDosSearchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
