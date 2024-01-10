//
//  Photo.swift
//  F35-Compartir
//
//  Created by Juan Gabriel Gomila Salas on 9/1/24.
//

import SwiftUI

struct Photo: Identifiable{
    var id = UUID()
    var image: Image
    var title: String
    var description: String
}

extension Photo: Transferable {
    static var transferRepresentation: some TransferRepresentation{
        ProxyRepresentation(exporting: \.image)
    }
}
