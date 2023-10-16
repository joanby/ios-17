//
//  NewTaskView.swift
//  F20-ToDos
//
//  Created by Juan Gabriel Gomila Salas on 9/10/23.
//

import SwiftUI

struct NewTaskView: View {
    
    @Binding var isShow: Bool
    
    @State var title: String
    @State var priority: Priority
    @State var isEditing = false
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack{
            Spacer()
            
            VStack(alignment: .leading){
                HStack{
                    Text("Añadir una nueva tarea")
                        .font(.system(.title, design: .rounded))
                    Spacer()
                    Button(action:{
                        self.isShow = false
                    }) {
                       Image(systemName: "xmark")
                            .foregroundStyle(.teal)
                            .font(.title)
                    }
                }
            }.padding()
            
            TextField("Introduce al descripción de la tarea", text: self.$title) { editingChanged in
                self.isEditing = editingChanged
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.bottom)
            
            Text("Prioridad")
                .font(.system(.headline, design: .rounded))
                .padding(.bottom)
            HStack{
                
                Text("Alta")
                    .font(.system(.headline, design: .rounded))
                    .padding(16)
                    .background(self.priority == .high ? Priority.high.color() : Color(.systemGray4))
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .onTapGesture {
                        self.priority = .high
                    }
                    
                Text("Media")
                    .font(.system(.headline, design: .rounded))
                    .padding(16)
                    .background(self.priority == .normal ? Priority.normal.color() : Color(.systemGray4))
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .onTapGesture {
                        self.priority = .normal
                    }
                
                Text("Baja")
                    .font(.system(.headline, design: .rounded))
                    .padding(16)
                    .background(self.priority == .low ? Priority.low.color() : Color(.systemGray4))
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .onTapGesture {
                        self.priority = .low
                    }
            }
            .padding(.bottom)
            
            Button(action: {
                
                if self.title.trimmingCharacters(in: .whitespaces) == "" {
                    return
                }
                
                self.isShow = false
                
                self.addNewTask(title: self.title, priority: self.priority)
                
            }, label: {
                Text("Guardar Tarea")
                    .font(.system(.headline, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(.teal)
                    .foregroundStyle(.white)
                    .cornerRadius(16)
            })
            .padding(.bottom)
        }
        .padding()
        .background(.white)
        .cornerRadius(16, antialiased: true)
        .offset(y: self.isEditing ? -320 : 0)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func addNewTask(title: String, priority: Priority, isCompleted: Bool = false){
        let task = Task(title: title, priority: priority, isCompleted: isCompleted)
        modelContext.insert(task)
    }
}

#Preview {
    NewTaskView(isShow: .constant(true), 
                title:"",
                priority: .normal)
}
