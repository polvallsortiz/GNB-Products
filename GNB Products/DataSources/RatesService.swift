//
//  RatesService.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 22/1/21.
//

import Alamofire
import SwiftyJSON

class RatesService {
    
    func apiRatesRequest(completionHandler: @escaping ([Rate], Bool) -> Void) {
        var rates = [Rate]()
        let headers: HTTPHeaders = [
                    "Content-Type":"application/json",
                    "Accept": "application/json"
        ]
        AF.request("http://quiet-stone-2094.herokuapp.com/rates", method: .get, headers: headers).validate().responseJSON { response in
            if let result = response.data {
                if let json = try? JSON(data: result) {
                    for (_, object) in json {
                        let rate = Rate(json: object)
                        rates.append(rate)
                    }
                    completionHandler(rates, false)
                }
            }
            else {
                completionHandler([Rate](), true)
            }
        }
    }
}
