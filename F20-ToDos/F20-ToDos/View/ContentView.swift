//
//  ContentView.swift
//  F20-ToDos
//
//  Created by Juan Gabriel Gomila Salas on 6/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Task.priorityNum, order: .reverse) var tasks: [Task]
    
    //MARK: Crear nueva tarea
    @State private var newTaskTitle: String = ""
    @State private var newTaskPriority: Priority = .normal
    
    @State private var showNewTask = false
    
    //MARK: Texto a buscar
    @State private var searchText = ""

    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Lista de Tareas")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Spacer()
                    Button(action: {
                        self.showNewTask = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundStyle(.teal)
                    })
                }
                .padding()
                
                SearchBar(text: self.$searchText)
                    .padding(.top, -16)
                
                List{
                    ForEach(self.tasks){ task in
                        TaskCell(task: task)
                    }
                    .onDelete(perform: { indexSet in
                        self.deleteTask(indexSet: indexSet)
                    })
                }
                .listStyle(.plain)
                .rotation3DEffect(
                    Angle(degrees: self.showNewTask ? 8 : 0),
                    axis: (x:1, y:0, z:0))
                .offset(y: self.showNewTask ? -40 : 0)
                .animation(.easeInOut, value: self.showNewTask)
                .onAppear{
                    UITableView.appearance().separatorColor = .clear
                }
                
                
                if self.tasks.count == 0{
                    NoTaskView()
                    
                }
                
                if self.showNewTask{
                    BlackView(backgroundColor: .teal)
                        .opacity(0.4)
                        .onTapGesture {
                            self.showNewTask = false
                        }
                    
                    NewTaskView(isShow: self.$showNewTask, title: "", priority: .normal).transition(.move(edge: .bottom))
                        .animation(.interpolatingSpring(stiffness: 180.0, damping: 20.0, initialVelocity: 12.0), value: self.showNewTask)
                }
                
                
            }
        }
    }

    private func deleteTask(indexSet: IndexSet){
        for index in indexSet {
            let taskToDelete = self.tasks[index]
            self.modelContext.delete(taskToDelete)
        }
    }
    
}
 
#Preview {
    ContentView()
        .modelContainer(previewContainer)
}

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Task.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        for index in 1...5{
            let newTask = Task(title: "Tarea nº\(index)")
            container.mainContext.insert(newTask)
        }
        
        return container
    } catch {
        fatalError("Error al crear el container")
    }
}()







struct NoTaskView: View {
    var body: some View {
        VStack{
            Image("welcome")
                .resizable()
                .scaledToFill()
            Text("No hay tareas para mostrar todavía. Puedes crear una utilizando el botón de la esquina superior derecha")
                .font(.system(.headline, design: .rounded))
                .padding()
            Spacer()
        }
        
        
    }
    
    
}

#Preview("No task") {
    NoTaskView()
}


struct TaskCell: View {
    @Bindable var task: Task
    
    var body: some View{
        Toggle(isOn: self.$task.isCompleted) {
            HStack{
                Text(self.task.title)
                    .font(.system(.callout, design: .rounded))
                    .strikethrough(self.task.isCompleted, color: .teal)
                    .bold()
                    .animation(.default)
                Spacer()
                Circle()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(self.task.priority.color())
            }
        }
        .toggleStyle(CheckboxStyle())
    }
}

struct CheckboxStyle: ToggleStyle{
    
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack{
            Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(configuration.isOn ? .teal : .gray)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
    }
    
}

#Preview("Celda"){
    TaskCell(task: Task(title: "Prueba de la preview", priority: .high))
}


struct BlackView: View {
    
    var backgroundColor: Color
    
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(self.backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}
