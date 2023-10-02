//
//  CourseDetailView.swift
//  F16-BottomSheet
//
//  Created by Juan Gabriel Gomila Salas on 2/10/23.
//

import SwiftUI

struct CourseDetailView: View {
    
    let course: Course
    
    var body: some View {
        VStack{
            HandleBar()
            TitleBar()
            HeaderView(course: self.course)
            ScrollView(.vertical){
                DetailView(icon: "person.fill", info: self.course.author)
                DetailView(icon: "chart.bar.fill", info: "Dificultad \(self.course.difficulty)/4")
                DetailView(icon: nil, info: self.course.description)
                    .padding(.top)
                
                DetailView(icon: nil, info: "Nunca se insistirá lo suficiente en el poder de los juegos en la educación y en el aprendizaje gamificado para aumentar el compromiso del estudiante. En los Premios de Educación y Formación 2023, no es de extrañar que uno de los principales nombres en este campo haya sido reconocido por sus esfuerzos. sus esfuerzos. Nos fijamos en Frogames Formación SL para ver cómo un destacado profesor ha convertido una empresa en una de las mejores del sector. Por eso han sido galardonados con el premio a la Educación online más innovadora de datos y habilidades digitales 2023.\n\nEntre 2015 y 2022, Juan Gabriel Gomila Salas impartió clases de matemáticas e informática en la Universidad de las Islas Baleares. Aquí su experiencia como científico de datos y diseñador de juegos para científico de datos y diseñador de juegos para empujar a los estudiantes a alcanzar su potencial. Después de haber enseñado a más de 500.000 estudiantes, impartiendo cientos de cursos en persona y a través de Zoom, quería probar algo diferente, algo más personal.\n\nEl resultado fue Frogames Formación.\n\nFrogames Formación es una plataforma que ofrece una forma gamificada de aprendizaje a través de cursos online, con un sistema de puntuaciones, clasificaciones y logros, así como una certificación blockchain final. Esta impresionante escuela de formación permite a los alumnos aprender, con seguimiento por parte de los instructores, así como acceso a una gran comunidad en la que todos pueden aprender. Usuarios de todo el mundo han podido podido aprender de expertos en temas tan variados como aprendizaje automático, desarrollo de Android desarrollo Android, Power BI, Python, desarrollo iOS o blockchain.")
            }

        }
        .background(.white)
        .cornerRadius(16, antialiased: true)
    }
}

struct HandleBar: View{
    var body: some View{
        Rectangle()
            .frame(width: 100, height: 8)
            .foregroundStyle(.teal)
            .cornerRadius(16)
    }
}

struct TitleBar: View{
    var body: some View{
        HStack{
            Text("Detalles del curso")
                .font(.title2)
                .foregroundStyle(.primary)
            
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

struct HeaderView: View{
    
    let course: Course
    
    var body: some View{
        Image(course.image)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width)
            .clipped()
            .overlay(
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        Text(course.name)
                            .foregroundStyle(.white)
                            .font(.system(.title, design: .rounded))
                            .bold()
                        
                        Text(course.path)
                            .font(.system(.subheadline, design: .rounded))
                            .padding(4)
                            .padding(.horizontal, 16)
                            .foregroundStyle(.white)
                            .background(Color.teal)
                            .cornerRadius(16)
                    }
                    
                    Spacer()
                }
                    .padding(24)
            )
    }
}

struct DetailView: View{
    
    let icon: String?
    let info: String
    
    var body: some View{
        HStack{
            if (self.icon != nil){
                Image(systemName: self.icon!)
                    .padding(.trailing, 10)
                    .foregroundStyle(.teal)
            }
            Text(self.info)
                .font(.system(.body, design: .rounded))
            
            Spacer()
        }.padding(.horizontal, 24)
    }
}

#Preview {
    CourseDetailView(course: CourseFactory().courses[0])
}
