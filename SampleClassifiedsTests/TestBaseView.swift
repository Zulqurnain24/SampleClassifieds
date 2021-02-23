//
//  TestBaseView.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 23/02/2021.
//

import UIKit
import XCTest
@testable import SampleClassifieds

class TestBaseView: XCTestCase {
    
    var sut: BaseView!
    
    override func setUp() {
        super.setUp()
        sut = BaseView()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testBaseView() {
       XCTAssertNotNil(sut)
       XCTAssertEqual(sut.frame, CGRect(x: 0, y: 0, width: 0, height: 0))
    }

}
