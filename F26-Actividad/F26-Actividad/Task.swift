//
//  Task.swift
//  F26-Actividad
//
//  Created by Juan Gabriel Gomila Salas on 7/11/23.
//

import Foundation

struct Task: Identifiable, Equatable {
    var id = UUID()
    var name = ""
    var progress: Double = 0.0 {
        didSet{
            progress = max(0.0, min(progress, 1.0))
        }
    }
    
    init(name: String, progress: Double = 0.0){
        self.name = name
        self.progress = progress
    }
}


class TaskStore: ObservableObject {
    @Published var tasks = sampleTasks
}

#if DEBUG
var sampleTasks = [
    Task(name: "KCal", progress: 0.23),
    Task(name: "Actividad", progress: 0.57),
    Task(name: "Horas de pie", progress: 0.1)
]
#endif
