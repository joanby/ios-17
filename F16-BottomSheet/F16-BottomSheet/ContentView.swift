//
//  ContentView.swift
//  F09-Listas
//
//  Created by Juan Gabriel Gomila Salas on 21/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedCourse: Course?
    @State private var selectedDetent: PresentationDetent = .medium
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(CourseFactory().courses){ course in
                    SimpleImageRow(course: course)
                        .onTapGesture {
                            self.selectedCourse = course
                        }
                }
                .listRowSeparatorTint(.teal)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Cursos de Frogames")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
        .sheet(item: self.$selectedCourse){ course in
            CourseDetailView(course: course)
                .ignoresSafeArea()
                .presentationDetents([.fraction(0.2), .height(250), .medium, .large], selection: self.$selectedDetent)
                .presentationDragIndicator(.hidden)
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
