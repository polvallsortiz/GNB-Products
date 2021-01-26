//
//  TransactionTests.swift
//  GNB ProductsTests
//
//  Created by Pol Valls Ortiz on 25/1/21.
//

import XCTest
import SwiftyJSON
@testable import GNB_Products

class TransactionTests: XCTestCase {

    var transactionOK, transactionKO : Transaction!
    
    override func setUp() {
        super.setUp()
        let rates = [Rate](arrayLiteral: Rate(json: JSON(parseJSON: "{\"from\" : \"CAD\", \"to\": \"EUR\", \"rate\": \"0.99\"}")))
        transactionOK = Transaction(json: JSON(parseJSON: "{\"sku\" : \"M2007\", \"amount\" : \"34.57\", \"currency\" : \"CAD\""), rates: rates)
        transactionKO = Transaction(json: JSON(parseJSON: "{\"sku\" : \"I1293\", \"amount\" : \"34.57\", \"currency\" : \"USD\""), rates: rates)
    }

    override func tearDown() {
        super.tearDown()
        transactionOK = nil
        transactionKO = nil
    }
    
    func testTransactionCreation() {
        //XCTAssertTrue(transactionOK.sku == "M2007")
        //XCTAssertTrue(transactionOK.amount == 34.57)
        //XCTAssertTrue(transactionOK.currency == "CAD")
        //XCTAssertTrue(transactionOK.eurAmount == 34.22)
        
        //XCTAssertTrue(transactionKO.eurAmount == 0.0)
    }

}
