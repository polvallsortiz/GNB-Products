//
//  ProductsService.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 21/1/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class ProductsService {
    
    func apiProductsRequest(rates : [Rate], completionHandler: @escaping ([Transaction], Bool) -> Void) {
        var transactions = [Transaction]()
        let headers: HTTPHeaders = [
                    "Content-Type":"application/json",
                    "Accept": "application/json"
        ]
        AF.request("http://quiet-stone-2094.herokuapp.com/transactions", method: .get, headers: headers).validate().responseJSON { response in
            if let result = response.data {
                if let json = try? JSON(data: result) {
                    for (_, object) in json {
                        let transaction = Transaction(json: object, rates: rates)
                        transactions.append(transaction)
                    }
                    completionHandler(transactions, false)
                }
            }
            else {
                completionHandler([Transaction](), true)
            }
        }
    }
    
}
