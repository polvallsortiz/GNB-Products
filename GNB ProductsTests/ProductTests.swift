//
//  ProductTests.swift
//  GNB ProductsTests
//
//  Created by Pol Valls Ortiz on 25/1/21.
//

import XCTest
import SwiftyJSON
@testable import GNB_Products

class ProductTests: XCTestCase {
    
    var product : Product!
    
    override func setUp() {
        super.setUp()
        var rates = [Rate]()
        rates.append(Rate(json: JSON(parseJSON: "{\"from\" : \"CAD\", \"to\": \"EUR\", \"rate\": \"0.99\"}")))
        let transactionOK = Transaction(json: JSON(parseJSON: "{\"sku\" : \"M2007\", \"amount\" : \"34.57\", \"currency\" : \"CAD\""), rates: rates)
        product = Product(transaction: transactionOK, rates: rates)
    }
    
    override func tearDown() {
        super.tearDown()
        product = nil
    }
    
    func testProductCreation(){
        //XCTAssertTrue(product.name == "M2007")
        //XCTAssertTrue(product.totalEUR == 34.22)
        //XCTAssertTrue(product.transactions.count == 1)
    }
    
    func testProductTransactionAdd(){
        var rates = [Rate]()
        rates.append(Rate(json: JSON(parseJSON: "{\"from\" : \"CAD\", \"to\": \"EUR\", \"rate\": \"0.99\"}")))
        let transactionOK = Transaction(json: JSON(parseJSON: "{\"sku\" : \"M2007\", \"amount\" : \"34.57\", \"currency\" : \"CAD\""), rates: rates)
        product.addTransaction(transaction: transactionOK)
        
        //XCTAssertTrue(product.transactions.count == 2)
        //XCTAssertTrue(product.totalEUR == 68.44)
    }



}
