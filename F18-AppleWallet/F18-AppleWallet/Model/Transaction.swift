//
//  Transaction.swift
//  F18-AppleWallet
//
//  Created by Juan Gabriel Gomila Salas on 3/10/23.
//

import Foundation

struct Transaction: Identifiable{
    var id = UUID()
    var merchant: String
    var amount: Double
    var date: String
    var icon: String = "dollarsign.circle"
}

#if DEBUG
var transactions = [
    Transaction(merchant: "Amazon", amount: 65, date: "3/10/2023", icon: "cart.circle"),
    Transaction(merchant: "Apple", amount: 30.45, date: "1/10/2023", icon: "apple.logo"),
    Transaction(merchant: "Netflix", amount: 7.99, date: "2/10/2023", icon: "movieclapper.fill"),
    Transaction(merchant: "Mercadona", amount: 21.67, date: "24/9/2023", icon: "takeoutbag.and.cup.and.straw.fill"),
    Transaction(merchant: "Starbucks", amount: 12.45, date: "30/9/2023", icon: "cup.and.saucer.fill")
]
#endif
