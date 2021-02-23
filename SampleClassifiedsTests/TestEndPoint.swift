//
//  TestEndPoint.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 22/02/2021.
//

import XCTest
import XCTest
@testable import SampleClassifieds

class TestEndpoint: XCTestCase {
    
    func testConfig() {
        XCTAssertEqual(Endpoint.getProducts.rawValue, "dynamodb-writer")
    }
}
