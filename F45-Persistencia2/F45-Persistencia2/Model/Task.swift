//
//  Task.swift
//  F45-Persistencia2
//
//  Created by Juan Gabriel Gomila Salas on 2/2/24.
//

import Foundation
import SwiftData

@Model class Task: Identifiable{
    
    var id: UUID
    var name: String
    var completed: Bool
    
    init(id: UUID = UUID(), name: String = "", completed: Bool = false) {
        self.id = id
        self.name = name
        self.completed = completed
    }
    
}
