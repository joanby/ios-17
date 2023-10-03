//
//  Course.swift
//  F17-Tinder
//
//  Created by Juan Gabriel Gomila Salas on 3/10/23.
//

import Foundation

struct Course {
    var name: String
    var image: String
}

#if DEBUG

var courses = [
    Course(name: "Curso de Álgebra lineal", image: "algebralineal"),
    Course(name: "Curso de Cálculo con Wolfram Alpha", image: "calculo"),
    Course(name: "Curso de Estadística Descriptiva", image: "descriptiva"),
    Course(name: "Curso de Matemática Discreta", image: "discreta"),
    Course(name: "Curso de Estadística Inferencial", image: "inferencia"),
    Course(name: "Curso de iOS 10", image: "ios10"),
    Course(name: "Curso de iOS 11", image: "ios11"),
    Course(name: "Curso de iOS 12", image: "ios12"),
    Course(name: "Curso de Swift UI", image: "ios13"),
    Course(name: "Curso de LaTeX", image: "latex"),
    Course(name: "Curso de Probabilidad", image: "probabilidad"),
    Course(name: "Curso de Sage", image: "sage"),
    Course(name: "Aprueba las matemáticas de selectividad", image: "selectividad"),
    Course(name: "Curso de Swift 5", image: "swift5")
]

#endif
