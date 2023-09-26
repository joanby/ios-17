//
//  ContentView.swift
//  F09-Listas
//
//  Created by Juan Gabriel Gomila Salas on 21/9/23.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var courses = [
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
    
    
    
    init(){
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.systemTeal,
            .font : UIFont(name: "ArialRoundedMTBold", size: 30)!
        ]
        navbarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.systemTeal,
            .font : UIFont(name: "ArialRoundedMTBold", size: 20)!
        ]
        
        UINavigationBar.appearance().standardAppearance = navbarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navbarAppearance
        UINavigationBar.appearance().compactAppearance = navbarAppearance
        
        navbarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.uturn.backward"), transitionMaskImage: UIImage(systemName: "arrow.uturn.backward"))
        
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(self.courses){ course in
                    
                    NavigationLink(destination: CourseDetailView(course: course)){
                        
                        SimpleImageRow(course: course)
                        
                        //CourseRow(course: self.courses[idx])
                        
                        /* if(0...2).contains(idx) {
                         FullImageRow(course: self.courses[idx])
                         }else{
                         SimpleImageRow(course: self.courses[idx])
                         }*/
                    }
                }
                //.listRowSeparator(.hidden)
                .listRowSeparatorTint(.teal)
            }
            .listStyle(.insetGrouped)
            /*.background(
                Image("discreta")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .ignoresSafeArea()
            )
            .scrollContentBackground(.hidden)*/
            .navigationTitle("Cursos de Frogames")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
        .tint(.teal)
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
        }
    }
}

struct FullImageRow: View {
    
    var course: Course
    
    var body: some View {
        ZStack{
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(height: 150)
                .cornerRadius(25)
                .overlay(
                    Rectangle()
                        .foregroundStyle(.gray)
                        .cornerRadius(25)
                        .opacity(0.4)
                )
            
            Text(course.name)
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundStyle(.white)
        }
    }
}

struct CourseRow: View{
    
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300)
                .cornerRadius(25)
            
            Text(course.name)
                .font(.system(.title, design: .rounded))
                .bold()
                .lineLimit(1)
                .padding(.bottom, 2)
            
            Text("Creado por \(course.author)".uppercased())
                .font(.system(.subheadline, design: .rounded))
                .foregroundStyle(.secondary)
                .lineLimit(2)
                .padding(.bottom, 2)
            
            HStack(spacing: 2){
                ForEach(1...(course.difficulty), id: \.self){ _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundStyle(.teal)
                }
            }
            
            Text(course.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(3)
                .padding(.bottom, 8)
        }
        
    }
}

