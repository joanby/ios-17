//
//  MenuItem.swift
//  F24-Desplegables
//
//  Created by Juan Gabriel Gomila Salas on 23/10/23.
//

import Foundation

struct MenuItem: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var submenuitems : [MenuItem]?
}


let dataPath = [
    MenuItem(name: "Curso de Estadística Descriptiva", image: "descriptiva"),
    MenuItem(name: "Curso de Álgebra Lineal", image: "algebralineal"),
    MenuItem(name: "Curso de Probabilidad y Variables Aleatorias", image: "probabilidad"),
    MenuItem(name: "Curso de Estadística Inferencial", image: "inferencia")
]

let iosPath = [
    MenuItem(name: "Curso de Swift 5", image: "swift5"),
    MenuItem(name: "Curso de Desarrollo de Apps para iOS 10", image: "ios10"),
    MenuItem(name: "Curso de Desarrollo de Apps para iOS 11", image: "ios11"),
    MenuItem(name: "Curso de Desarrollo de Apps para iOS 12", image: "ios12"),
    MenuItem(name: "Curso de Swift UI con iOS 13", image: "ios13")
]

let mathsPath = [
    MenuItem(name: "Curso de Latex desde cero", image: "latex"),
    MenuItem(name: "Curso de Estadística Descriptiva", image: "descriptiva"),
    MenuItem(name: "Curso de Álgebra Lineal", image: "algebralineal"),
    MenuItem(name: "Curso de Matemática Discreta", image: "discreta"),
    MenuItem(name: "Curso de Sage desde cero", image: "sage"),
    MenuItem(name: "Curso de Cálculo en una variable", image: "calculo"),
    MenuItem(name: "Curso de Probabilidad y Variables Aleatorias", image: "probabilidad"),
    MenuItem(name: "Curso de Estadística Inferencial", image: "inferencia")
]


let learningPaths = [
    MenuItem(name: "Ruta de Análisis de Datos", image: "_ruta-analisis-datos", submenuitems: dataPath ),
    MenuItem(name: "Ruta de Desarrollo iOS", image: "_ruta-ios", submenuitems: iosPath),
    MenuItem(name: "Ruta de Matemáticas Avanzadas", image: "_ruta-matematicas", submenuitems: mathsPath)
]
