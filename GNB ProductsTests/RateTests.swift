//
//  RateTests.swift
//  GNB ProductsTests
//
//  Created by Pol Valls Ortiz on 25/1/21.
//

import XCTest
import SwiftyJSON
@testable import GNB_Products

class RateTests: XCTestCase {
    
    var rate : Rate!
    
    override func setUp() {
        super.setUp()
        rate = Rate(json: JSON(parseJSON: "{\"from\" : \"CAD\", \"to\": \"EUR\", \"rate\": \"0.99\"}"))
    }
    
    override func tearDown() {
        super.tearDown()
        rate = nil
    }
    
    func testCheckCreation() {
        XCTAssertTrue(rate.from == "CAD")
        XCTAssertTrue(rate.to == "EUR")
        XCTAssertTrue(rate.rate == 0.99)
    }

}
