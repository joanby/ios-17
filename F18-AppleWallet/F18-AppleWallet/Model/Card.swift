//
//  Card.swift
//  F18-AppleWallet
//
//  Created by Juan Gabriel Gomila Salas on 3/10/23.
//

import Foundation


struct Card: Identifiable {
    var id = UUID()
    var name: String
    var type: CardType
    var number: String
    var expirationDate: String
    var image: String {
        return type.rawValue
    }
}

enum CardType: String{
    case visa //="visa"
    case mastercard
    case amex
    case chase
    case discover
}

#if DEBUG
var cardsData = [
    Card(name: "Juan Gabriel Gomila", type: .visa, number: "1234 5678 9123 4567", expirationDate: "09/26"),
    Card(name: "María Santos", type: .amex, number: "4242 4343 4444 4545", expirationDate: "12/27"),
    Card(name: "Margarita Salas", type: .chase, number: "1919 1919 1919 1919", expirationDate: "05/25"),
    Card(name: "Gabriel Gomila", type: .discover, number: "0000 0001 0002 0003", expirationDate: "12/29"),
    Card(name: "Frogames Formación", type: .mastercard, number: "6060 7070 8080 9090", expirationDate: "04/26")
]
#endif
