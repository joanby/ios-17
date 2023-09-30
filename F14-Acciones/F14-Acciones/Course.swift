//
//  Course.swift
//  F09-Listas
//
//  Created by Juan Gabriel Gomila Salas on 21/9/23.
//

import Foundation

struct Course: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var author: String
    var difficulty: Int
    var description: String
}


