//
//  ContentView.swift
//  F09-Listas
//
//  Created by Juan Gabriel Gomila Salas on 21/9/23.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State var courses = [
        Course(name: "Álgebra Lineal", image: "algebralineal", author: "María Santos", difficulty: 1, description: "Curso para iniciarse en el mundo del álgebra lineal"),
        Course(name: "Cálculo", image: "calculo", author: "Arnau Mir y Llorenç Valverde", difficulty: 2, description: "Descubre todo el mundo del cálculo en una variable y practica con Wolfram Alpha y Python"),
        Course(name: "Estadística Descriptiva", image: "descriptiva", author: "María Santos y Juan Gabriel", difficulty: 2, description: "Descubre la Estadística Descriptiva con R y Python"),
        Course(name: "Estadística Inferencial", image: "inferencia", author: "Ricardo Alberich y Arnau Mir", difficulty: 3, description: "Descubre el poder de la inferencia estadística implementando tus tests con R"),
        Course(name: "Matemática Discreta", image: "discreta", author: "Juan Gabriel Gomila", difficulty: 2, description: "Piensa como todo un matemático con los ejerciicos prácticos"),
        Course(name: "Probabilidad", image: "probabilidad", author: "Arnau Mir y  Ricardo Alberich", difficulty: 3, description: "Resuelve problemas de probabilidad y variables aleatoria desde cero y sin experiencia previa"),
        Course(name: "Curso de Latex", image: "latex", author: "Llorenç Valverde y Juan Gabriel Gomila", difficulty: 1, description: "Redacta documentos profesionales gracias al poder de LaTeX"),
        Course(name: "Curso de Sage", image: "sage", author: "Llorenç Valverde y Juan Gabriel Gomila", difficulty: 1, description: "Aprovecha el poder de Sage para resolver problemas matemáticos sin esfuerzo"),
        Course(name: "Prepara la Selectividad", image: "selectividad", author: "María Santos", difficulty: 2, description: "Más de 100 ejercicios resueltos de matemáticas de bachillerato para preparar tu examen de selectividad"),
        Course(name: "Curso de Swift 5 desde cero", image: "swift5", author: "Juan Gabriel Gomila", difficulty: 1, description: "Aprende a programar con el lenguaje oficial para crear apps para dispositivos de iOS"),
        Course(name: "Curso de iOS 10", image: "ios10", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple"),
        Course(name: "Curso de iOS 11", image: "ios11", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple"),
        Course(name: "Curso de iOS 12", image: "ios12", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple"),
        Course(name: "Curso de Swift UI con iOS 13", image: "ios13", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple y el nuevo Framework de Swift UI")
    ]

    @State private var showDialog = false
    @State private var selectedCourse: Course?
    
    var body: some View {
        List{
            ForEach(self.courses){ course in
                SimpleImageRow(course: course)
                    .contextMenu{
                        Button(action: {
                            self.delete(course: course)
                        }) {
                            HStack{
                                Text("Eliminar")
                                Image(systemName: "trash")
                            }
                        }
                        
                        Button(action: {
                            self.setFavourite(course: course)
                        }, label: {
                            HStack{
                                Text(course.isFavourite ? "Desmarcar de Favorito" : "Marcar como Favorito")
                                Image(systemName: "star")
                            }
                        })
                    }
                    .onTapGesture {
                        self.showDialog.toggle()
                        self.selectedCourse = course
                    }
                    .confirmationDialog("Selecciona la acción a realizar", isPresented: self.$showDialog) {
                        
                        Button("Marcar como Favorito") {
                            if let selectedCourse = self.selectedCourse{
                                self.setFavourite(course: selectedCourse)
                            }
                        }
                        
                        Button("Eliminar curso", role: .destructive){
                            if let selectedCourse = self.selectedCourse {
                                self.delete(course: selectedCourse)
                            }
                        }
                        
                        Button("Cancelar", role: .cancel) {
                            self.showDialog = false
                        }
                    }
            }
            .onDelete { (indexSet) in
                self.courses.remove(atOffsets: indexSet)
            }
        }
        .listStyle(.insetGrouped)
    }
    
    
    private func delete(course: Course){
        if let index = self.courses.firstIndex(where: { $0.id == course.id }){
            self.courses.remove(at: index)
        }
    }
    
    private func setFavourite(course: Course){
        if let index = self.courses.firstIndex(where: {$0.id == course.id}){
            self.courses[index].isFavourite.toggle()
        }
    }
    
    
}





#Preview {
    ContentView()
}

struct SimpleImageRow: View {
    
    var course: Course
    
    var body: some View {
        HStack{
            Image(course.image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            
            Text(course.name)
            
            if (course.isFavourite){
                Spacer()
                
                Image(systemName: "star.circle")
                    .foregroundStyle(.yellow)
            }
        }
    }
}
