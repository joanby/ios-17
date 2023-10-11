//
//  F20_ToDosApp.swift
//  F20-ToDos
//
//  Created by Juan Gabriel Gomila Salas on 6/10/23.
//

import SwiftUI
import SwiftData

@main
struct F20_ToDosApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
