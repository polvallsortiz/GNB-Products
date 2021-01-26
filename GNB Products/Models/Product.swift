//
//  Product.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 21/1/21.
//

import Foundation

class Product : NSObject {
    var name : String
    var transactions : [Transaction]
    var totalEUR : Decimal
    
    init(transaction : Transaction, rates : [Rate]) {
        self.name = transaction.sku
        self.transactions = [transaction]
        self.totalEUR = transaction.eurAmount
    }
    
    func addTransaction(transaction : Transaction) {
        self.transactions.append(transaction)
        self.totalEUR += transaction.eurAmount
    }
}
