//
//  TestWebserviceManager.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 22/02/2021.
//

import UIKit
import XCTest
@testable import SampleClassifieds

class TestWebserviceManager: XCTestCase {
    
    var sut: WebserviceManager!
    
    override func setUp() {
        super.setUp()
        sut = WebserviceManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCallProductsListService() {
        
        let expectation = self.expectation(description: #function)
               
        sut.callProductsListService { (products) in
            expectation.fulfill()
            XCTAssertTrue((products?.results?.count ?? 0) > 0)
        } _: { (error) in
            
        }
        self.waitForExpectations(timeout: 10)

    }

}
