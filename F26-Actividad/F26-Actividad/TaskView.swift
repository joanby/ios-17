//
//  TaskView.swift
//  F26-Actividad
//
//  Created by Juan Gabriel Gomila Salas on 7/11/23.
//

import SwiftUI

struct TaskView: View {
    
    @State private var averageProgress = 0.0
    @State private var tasks = TaskStore().tasks
    
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("Tareas Diarias")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
            
            HStack{
                Text("Progreso Global")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Spacer()
                
                ProgressRing(thickness: /*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, color: .white, gradient: Gradient(colors: [.darkPurple, .lightPurple]), progress: self.$averageProgress)
            }
            .padding(.all, 24)
            .background(Color.teal)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .padding(.horizontal)
            
            
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(self.tasks.indices, id: \.self){ idx in
                    TaskProgressView(task: self.$tasks[idx])
                }
            })
            
            Spacer()
        })
        .onAppear{
            self.averageProgress = tasks.reduce(0) {$0 + $1.progress}/Double(self.tasks.count)
        }
        .onChange(of: self.tasks) { newValue in
            self.averageProgress = tasks.reduce(0) {$0 + $1.progress}/Double(self.tasks.count)
        }
    }
}

struct TaskProgressView: View{
    @Binding var task: Task
    
    var color: Color = .lightPurple
    
    private var progressText: String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        
        return formatter.string(from: NSNumber(value: self.task.progress)) ?? "0"
    }
    
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack{
                Text(self.task.name)
                    .font(.system(.headline, design: .rounded))
                
                Text(self.progressText)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(self.color.opacity(0.75))
            }
            
            HStack{
                Text("0%")
                    .font(.system(.subheadline, design: .rounded))
                Slider(value: self.$task.progress, in: 0...1, step: 0.05)
                    .accentColor(self.color)
                Text("100%")
                    .font(.system(.subheadline, design: .rounded))
            }
        })
        .padding(.all)
        .background(Color.teal.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 24.0, style: .continuous))
        .padding(.horizontal)
    }
}



#Preview {
    TaskView()
}
