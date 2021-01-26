//
//  Product.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 21/1/21.
//

import Foundation
import SwiftyJSON

class Transaction : NSObject {
    var sku : String
    var amount : Decimal
    var currency : String
    var eurAmount : Decimal
    
    init(json : JSON, rates : [Rate]) {
        self.sku = json["sku"].string != nil ? json["sku"].string! : ""
        self.amount = json["amount"].string != nil ? Decimal(string: json["amount"].string!)! : 0.0
        self.currency = json["currency"].string != nil ? json["currency"].string! :""
        var eurAmountAux  = self.currency == "EUR" ? self.amount : Transaction.calculateEUR(amount: self.amount, currency : self.currency, rates : rates)
        self.eurAmount = 0.0
        NSDecimalRound(&self.eurAmount, &eurAmountAux, 2, NSDecimalNumber.RoundingMode.bankers)
    }
    
    class func calculateEUR(amount : Decimal, currency : String, rates : [Rate]) -> Decimal {
        if let rateIndex = rates.firstIndex(where: {$0.from == currency && $0.to == "EUR"}) {
            return amount * rates[rateIndex].rate
        }
        else {
            if let rateIndex = rates.firstIndex(where: {$0.from == currency}) {
                return calculateEUR(amount: amount * rates[rateIndex].rate, currency: rates[rateIndex].to, rates: rates)
            }
            else {
                return 0.0
            }
        }
    }
}
