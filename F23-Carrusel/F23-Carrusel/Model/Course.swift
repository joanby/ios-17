//
//  Course.swift
//  F23-Carrusel
//
//  Created by Juan Gabriel Gomila Salas on 19/10/23.
//

import Foundation

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

#if DEBUG

let courses = [ Course(title: "Curso de Álgebra Lineal", image: "algebralineal"),
                Course(title: "Curso de Cálculo en una Variable", image: "calculo"),
                Course(title: "Curso de Estadística Descriptiva", image: "descriptiva"),
                Course(title: "Curso de Matemática Discreta", image: "discreta"),
                Course(title: "Curso de Estadística Inferencial", image: "inferencia"),
                Course(title: "Curso Completo de Desarrollo de Apps para iOS 10", image: "ios10"),
                Course(title: "Curso Completo de Desarrollo de Apps para iOS 11", image: "ios11"),
                Course(title: "Curso Completo de Desarrollo de Apps para iOS 12", image: "ios12"),
                Course(title: "Curso Completo de Swift UI para iOS 13", image: "ios13")
]

#endif
