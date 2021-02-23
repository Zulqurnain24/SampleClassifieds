//
//  TestConfig.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 22/02/2021.
//

import XCTest
import XCTest
@testable import SampleClassifieds

class TestConfig: XCTestCase {
    
    func testConfig() {
        XCTAssertEqual(config.baseURL, "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/")
    }
}
