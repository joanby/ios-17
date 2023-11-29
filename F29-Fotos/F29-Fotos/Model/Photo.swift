//
//  Photo.swift
//  F29-Fotos
//
//  Created by Juan Gabriel Gomila Salas on 29/11/23.
//

import Foundation

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let samplePhotos = (1...14).map{ Photo(name: "\($0)") }
