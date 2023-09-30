//
//  CourseDetailView.swift
//  F09-Listas
//
//  Created by Juan Gabriel Gomila Salas on 21/9/23.
//

import SwiftUI

struct CourseDetailView: View{
    
    @Environment(\.dismiss) var dismiss
    //Antes de iOS 15
    //@Environment(\.presentationMode) var presentationMode
    
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(25)
            
            Text(course.name)
                .font(.system(.title, design: .rounded))
                .bold()
                .padding(.bottom, 2)
            
            Text("Creado por \(course.author)".uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(.secondary)
                .padding(.bottom, 2)
            
            HStack(spacing: 2){
                Text("Dificultad: ")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.teal)
                
                Image(systemName: "cellularbars", variableValue: Double(course.difficulty)/4)
                    .font(.subheadline)
                    .foregroundStyle(.teal)
                
                /*ForEach(1...(course.difficulty), id: \.self){ _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundStyle(.teal)
                }*/
            }
            
            Text(course.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.bottom, 8)
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button(){
                    dismiss()
                    //Antes de iOS 15
                    //presentationMode.wrappedValue.dismiss()
                } label:{
                    Text("\(Image(systemName: "arrow.uturn.backward"))\(course.name)")
                        .foregroundStyle(.teal)
                }
            }
        }
    }
}


#Preview {
    CourseDetailView(course: Course(name: "Álgebra Lineal", image: "algebralineal", author: "María Santos", difficulty: 1, description: "Curso para iniciarse en el mundo del álgebra lineal"))
}
