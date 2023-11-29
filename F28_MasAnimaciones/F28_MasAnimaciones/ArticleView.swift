//
//  ArticleView.swift
//  F28_MasAnimaciones
//
//  Created by Juan Gabriel Gomila Salas on 25/11/23.
//

import SwiftUI

struct ArticleView: View {
    
    @Namespace private var articleTransition
    
    @State private var expanded = false
    
    var body: some View {
        if self.expanded {
           FullArticleView(expanded: self.$expanded,
                                articleTransition: self.articleTransition)
                
        } else {
            ExcerptArticleView(expanded: self.$expanded,
                               articleTransition: self.articleTransition)
        }
    }
}

#Preview {
    ArticleView()
}

struct FullArticleView: View {
    
    @Binding var expanded: Bool
    
    var articleTransition: Namespace.ID
    
    var body: some View {
        ScrollView{
        VStack{
            
            Image("ios10")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 300)
                .clipped()
                .matchedGeometryEffect(id: "image", in: self.articleTransition)
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.0, blendDuration: 0.5)){
                        self.expanded.toggle()
                    }
                }
            
            Text("""
Swift 3 fue lanzado el 13 de junio de 2016. Obtener un buen inicio en la última versión del Swift antes que los demás es vital para tener garantías de éxito como programador.

¿Alguna vez has querido probar la programación de apps? ¿Has tratado de aprender Swift, sólo para acabar harto de los incompletos tutoriales de YouTube o las clases o documentación en inglés? ¿Has empezado a migrar código de Swift 2 a 3?

Pues entonces no busques más: ¡este curso es para ti!

En este curso,  Swift 3 es el protagonista. En él aprenderemos la información básica que tienes que saber para iniciarte en Swift 3. Mi objetivo fundamental es que vosotros, futuros estudiantes, aprendáis con garantías de éxito. Si no me crees, échale un vistazo al resto de mis cursos y observa qué opinan los estudiantes de los mismos. Su palabra vale más que cualquier justificación que te quiera dar yo mismo.

Creo que se aprende mejor haciendo cosas. Por tanto, el formato será de clases en vídeo, seguidas por un ejercicio para ponerte a prueba, algún que otro examen a final de cada sección e incluso combinaremos las partes más teóricas de conceptos, con aspectos más prácticos llevando a cabo desarrollo de apps totalmente funcionales. Este formato te permitirá aprender  Swift en todo su esplendor y no solamente seguir las clases como un robot.

Swift se convirtió en un lenguaje Open Source en diciembre de 2015 por lo que ahora podrás hacer tus propias apps y seguir este curso tanto en Mac, como en Windows como en Linux!



Swift, un lenguaje moderno evolucionado a partir de Objective-C

Swift es un lenguaje de programación multi-paradigma desarrollado por Apple para su uso con iOS y OS X. Diseñado para reemplazar Objective C, se inició el proyecto Swift en 2010 y la primera aplicación móvil se estrenó en junio de 2014 en la Conferencia Mundial de Desarrolladores. A pesar de su objetivo de reemplazar Objective C, Swift es capaz de trabajar junto con el lenguaje Objective-C  más anticuado durante el uso de los frameworks de Cocoa Touch y Foundation.

Swift se construye con el compilador LLVM incluido desde Xcode 6 beta, y utiliza el tiempo de ejecución de Objective-C, lo que permite utilizar Objective-C, Objective-C ++ y  Swift para funcionar dentro de un mismo programa. Durante su debut, Swift fue descrito como "Objective C sin la C" por el Vicepresidente de Ingeniería de Software Craig Federighi de Apple.
""")
            .matchedGeometryEffect(id: "text", in: self.articleTransition)
            .animation(nil, value: self.expanded)
            .padding(.all)
            
            Spacer()
            
        }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ExcerptArticleView: View {
    
    @Binding var expanded: Bool
    
    var articleTransition: Namespace.ID
    
    var body: some View {
        VStack{
            
            Spacer()
            
            VStack{
                
                Image("ios10")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 200)
                    .matchedGeometryEffect(id: "image", in: self.articleTransition)
                    .cornerRadius(20)
                    .padding()
                    .onTapGesture {
                        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.8, blendDuration: 0.2)){
                            self.expanded.toggle()
                        }
                    }
                
                Text("El curso de iOS 10 es uno de los primeros que Juan Gabriel grabó en el nuevo lenguaje de Swift allá por el año 2016.")
                    .matchedGeometryEffect(id: "text", in: self.articleTransition)
                    .padding(.horizontal)
            }
            
            
        }
    }
}
