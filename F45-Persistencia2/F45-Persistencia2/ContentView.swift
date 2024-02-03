//
//  ContentView.swift
//  F45-Persistencia2
//
//  Created by Juan Gabriel Gomila Salas on 2/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var tasks: [Task]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(self.tasks){ task in
                    HStack{
                        Text(task.name)
                        Spacer()
                        
                        if(task.completed){
                            Image(systemName: "checkmark")
                        }
                    }
                    .onTapGesture {
                        task.completed.toggle()
                    }
                }
                .onDelete(perform: { indexSet in
                    self.deleteItems(offsets: indexSet)
                })
            }
            .navigationTitle("Lista de Tareas")
            .toolbar{
                Button("", systemImage: "plus"){
                    self.addItem()
                }
            }
        }
    }

    private func addItem() {
        self.modelContext.insert(self.generateRandomTask())
    }

    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            let taskToDelete = self.tasks[index]
            self.modelContext.delete(taskToDelete)
        }
    }
    
    
    
    
    private func generateRandomTask() -> Task {
    
        let tasks = ["Comprar verduras", "Terminar los deberes", "Estudiar curso de iOS", "Ir a clase de Yoga", "Leer una novela", "Escribir un post del blog", "Limpiar la casa", "Atender una llamada", "Grabar episodio del podcast"]
        
        let rndIndex = Int.random(in: 0..<tasks.count)
        let rndTask = tasks[rndIndex]
        
        return Task(name: rndTask, completed: Bool.random())
        
    }
    
    
    
   
    
}


@MainActor
let previewContainer: ModelContainer = {
    do{
        let container = try ModelContainer(for: Task.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        
        let tasks = ["Comprar verduras", "Terminar los deberes", "Estudiar curso de iOS", "Ir a clase de Yoga", "Leer una novela", "Escribir un post del blog", "Limpiar la casa", "Atender una llamada", "Grabar episodio del podcast"]
    
        
        for _ in 1...10 {
            let rndIndex = Int.random(in: 0..<tasks.count)
            let rndTask = tasks[rndIndex]
            
            container.mainContext.insert(Task(name: rndTask, completed: Bool.random()))
        }
        
        return container
    } catch {
        fatalError("Error al crear el contenedor del modelo")
    }
}()


#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
