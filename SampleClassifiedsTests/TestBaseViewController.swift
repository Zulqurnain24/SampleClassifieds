//
//  TestBaseViewController.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 23/02/2021.
//

import UIKit
import XCTest
@testable import SampleClassifieds

class TestBaseViewController: XCTestCase {
    
    var sut: BaseViewController!
    
    override func setUp() {
        super.setUp()
        sut = BaseViewController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testBaseViewController() {
       XCTAssertNotNil(sut)
       XCTAssertNotNil(sut.view)
    }

}
