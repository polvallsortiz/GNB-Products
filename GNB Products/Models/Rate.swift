//
//  Rate.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 21/1/21.
//

import Foundation
import SwiftyJSON

struct Rate{
    let from : String
    let to : String
    let rate : Decimal
    
    init(json : JSON) {
        self.from = json["from"].string != nil ? json["from"].string! : ""
        self.to = json["to"].string != nil ? json["to"].string! : ""
        self.rate = json["rate"].string != nil ? Decimal(string: json["rate"].string!)! : 0.0
    }
}
